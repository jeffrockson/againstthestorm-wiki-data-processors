#!/usr/bin/env python3
"""
MediaWiki API client for Against the Storm wiki data processors.
Handles fetching and updating page content via MediaWiki API.
"""

from typing import Optional
from urllib.parse import urljoin
import os
import time
import requests
from dotenv import load_dotenv

class MediaWikiClient:
    """Client for interacting with MediaWiki API."""
    
    def __init__(self, base_url: str = "http://localhost:4000", username: Optional[str] = None, password: Optional[str] = None):
        """
        Initialize MediaWiki client.
        
        Args:
            base_url: Base URL of the MediaWiki instance
            username: Username for authentication (optional)
            password: Password for authentication (optional)
        """
        self.base_url = base_url.rstrip('/')
        self.api_url = urljoin(self.base_url, '/api.php')
        self.username = username
        self.password = password
        self.csrf_token = None
        self.session = requests.Session()
        
        # Set up session headers
        self.session.headers.update({
            'User-Agent': 'AgainstTheStorm-Wiki-Data-Processors/1.0'
        })
    
    def authenticate(self) -> bool:
        """
        Authenticate with MediaWiki API and get CSRF token.
        
        Returns:
            True if authentication successful, False otherwise
        """
        if not self.username or not self.password:
            print("Error: Username and password are required for authentication.")
            return False
        
        try:
            # Get login token
            login_token_response = self.session.get(self.api_url, params={
                'action': 'query',
                'meta': 'tokens',
                'type': 'login',
                'format': 'json'
            })
            login_token_response.raise_for_status()
            
            login_token = login_token_response.json()['query']['tokens']['logintoken']
            
            # Perform login
            login_response = self.session.post(self.api_url, data={
                'action': 'login',
                'lgname': self.username,
                'lgpassword': self.password,
                'lgtoken': login_token,
                'format': 'json'
            })
            login_response.raise_for_status()
            
            login_result = login_response.json()['login']
            if login_result['result'] != 'Success':
                print(f"Login failed: {login_result.get('reason', 'Unknown error')}")
                return False
            
            # Get CSRF token
            csrf_response = self.session.get(self.api_url, params={
                'action': 'query',
                'meta': 'tokens',
                'type': 'csrf',
                'format': 'json'
            })
            csrf_response.raise_for_status()
            
            self.csrf_token = csrf_response.json()['query']['tokens']['csrftoken']
            print(f"Successfully authenticated as {self.username}")
            return True
            
        except requests.RequestException as e:
            print(f"Authentication failed: {e}")
            return False
        except KeyError as e:
            print(f"Unexpected API response format: {e}")
            return False
    
    
    def get_page_revision_id(self, page_title: str) -> Optional[str]:
        """
        Get the current revision ID of a page.
        
        Args:
            page_title: Title of the page
            
        Returns:
            Revision ID as string, or None if failed
        """
        try:
            response = self.session.get(self.api_url, params={
                'action': 'query',
                'prop': 'revisions',
                'rvprop': 'ids',
                'titles': page_title,
                'format': 'json'
            })
            response.raise_for_status()
            
            data = response.json()
            pages = data['query']['pages']
            
            # Get the first (and should be only) page
            page_id = list(pages.keys())[0]
            page_data = pages[page_id]
            
            if 'missing' in page_data:
                return None  # Page doesn't exist
            
            if 'revisions' not in page_data:
                return None
            
            return page_data['revisions'][0]['revid']
            
        except requests.RequestException as e:
            print(f"Failed to get revision ID for page '{page_title}': {e}")
            return None
        except KeyError as e:
            print(f"Unexpected API response format for page '{page_title}': {e}")
            return None
    
    def get_input_file_revision_id(self, page_title: str) -> Optional[str]:
        """
        Get the current revision ID of the input data file.
        This is used to check if the source data has changed.
        
        Args:
            page_title: Title of the input data page (e.g., "Module:Resource/Goods.csv")
            
        Returns:
            Revision ID as string, or None if failed
        """
        return self.get_page_revision_id(page_title)
    
    def fetch_page_content(self, page_title: str) -> Optional[str]:
        """
        Fetch content of a MediaWiki page.
        
        Args:
            page_title: Title of the page to fetch
            
        Returns:
            Page content as string, or None if failed
        """
        try:
            response = self.session.get(self.api_url, params={
                'action': 'query',
                'prop': 'revisions',
                'rvprop': 'content',
                'titles': page_title,
                'format': 'json'
            })
            response.raise_for_status()
            
            data = response.json()
            pages = data['query']['pages']
            
            # Get the first (and should be only) page
            page_id = list(pages.keys())[0]
            page_data = pages[page_id]
            
            if 'missing' in page_data:
                print(f"Page '{page_title}' not found")
                return None
            
            if 'revisions' not in page_data:
                print(f"No revisions found for page '{page_title}'")
                return None
            
            content = page_data['revisions'][0]['*']
            return content
            
        except requests.RequestException as e:
            print(f"Failed to fetch page '{page_title}': {e}")
            return None
        except KeyError as e:
            print(f"Unexpected API response format for page '{page_title}': {e}")
            return None
    
    def update_page_content(self, page_title: str, content: str, summary: str = "Updated via ETL processor") -> bool:
        """
        Update content of a MediaWiki page.
        
        Args:
            page_title: Title of the page to update
            content: New content for the page
            summary: Edit summary
            
        Returns:
            True if update successful, False otherwise
        """
        if not self.csrf_token:
            print("Error: No CSRF token available. Authentication is required.")
            return False
        
        try:
            # Check content size first
            if len(content) > 5 * 1024 * 1024:  # 2MB limit
                print(f"Content too large ({len(content)} bytes) for page '{page_title}'")
                return False
            
            # Get current revision ID to avoid edit conflicts
            revision_id = self.get_page_revision_id(page_title)
            
            edit_data = {
                'action': 'edit',
                'title': page_title,
                'text': content,
                'summary': summary,
                'token': self.csrf_token,
                'format': 'json',
                'bot': 'true',  # Mark as bot edit to help with rate limiting
                'minor': 'false'  # Explicitly set as major edit
            }
            
            # Add revision ID if page exists to avoid edit conflicts
            if revision_id:
                edit_data['baserevid'] = revision_id
            
            response = self.session.post(self.api_url, data=edit_data)
            response.raise_for_status()
            
            result = response.json()
            
            # Check for top-level errors first
            if 'error' in result:
                error_info = result['error']
                error_code = error_info.get('code', '')
                error_message = error_info.get('info', 'Unknown error')
                
                # Handle specific error cases
                if error_code in ['badtoken', 'notoken'] and self.username and self.password:
                    print("Token expired, attempting to refresh...")
                    if self.authenticate():
                        # Retry the update with new token
                        return self.update_page_content(page_title, content, summary)
                elif error_code == 'ratelimited':
                    print("Rate limited. Waiting 5 seconds before retry...")
                    time.sleep(5)
                    return self.update_page_content(page_title, content, summary)
                elif error_code == 'articleexists':
                    print(f"Page '{page_title}' already exists. This shouldn't happen with edit action.")
                    return False
                
                print(f"Failed to update page '{page_title}': {error_message} (code: {error_code})")
                return False
            
            # Check for successful edit
            if 'edit' in result and result['edit']['result'] == 'Success':
                print(f"Successfully updated page '{page_title}'")
                return True
            else:
                # Handle edit-specific errors
                error_info = result.get('edit', {}).get('error', {})
                error_code = error_info.get('code', '')
                error_message = error_info.get('info', 'Unknown error')
                
                # Handle specific error cases
                if error_code in ['badtoken', 'notoken'] and self.username and self.password:
                    print("Token expired, attempting to refresh...")
                    if self.authenticate():
                        # Retry the update with new token
                        return self.update_page_content(page_title, content, summary)
                elif error_code == 'ratelimited':
                    print("Rate limited. Waiting 5 seconds before retry...")
                    time.sleep(5)
                    return self.update_page_content(page_title, content, summary)
                elif error_code == 'editconflict':
                    print(f"Edit conflict on page '{page_title}'. Page may have been modified by another user.")
                    return False
                elif error_code == 'protectedpage':
                    print(f"Page '{page_title}' is protected and cannot be edited.")
                    return False
                
                print(f"Failed to update page '{page_title}': {error_message} (code: {error_code})")
                return False
                
        except requests.RequestException as e:
            print(f"Failed to update page '{page_title}': {e}")
            return False
        except KeyError as e:
            print(f"Unexpected API response format for page update '{page_title}': {e}")
            return False
    
    def test_connection(self) -> bool:
        """
        Test connection to MediaWiki API.
        
        Returns:
            True if connection successful, False otherwise
        """
        try:
            response = self.session.get(self.api_url, params={
                'action': 'query',
                'meta': 'siteinfo',
                'format': 'json'
            })
            response.raise_for_status()
            
            data = response.json()
            site_name = data['query']['general']['sitename']
            print(f"Connected to MediaWiki site: {site_name}")
            return True
            
        except requests.RequestException as e:
            print(f"Failed to connect to MediaWiki API: {e}")
            return False
        except KeyError as e:
            print(f"Unexpected API response format: {e}")
            return False


def create_client(base_url: str = "http://localhost:4000", username: Optional[str] = None, password: Optional[str] = None) -> MediaWikiClient:
    """
    Create and initialize a MediaWiki client.
    
    Args:
        base_url: Base URL of the MediaWiki instance
        username: Username for authentication (optional)
        password: Password for authentication (optional)
        
    Returns:
        Initialized MediaWikiClient instance
    """
    # Load environment variables
    load_dotenv()
    
    # Use URL from environment if available, otherwise use provided base_url
    env_url = os.getenv('MEDIAWIKI_URL', base_url)
    final_url = base_url if base_url != "http://localhost:4000" else env_url
    
    client = MediaWikiClient(final_url, username, password)
    
    # Test connection
    if not client.test_connection():
        print("Warning: Could not connect to MediaWiki API")
        return client
    
    # Authenticate if credentials provided
    if username and password:
        if not client.authenticate():
            print("Error: Authentication failed. Exiting.")
            return client
    
    return client
