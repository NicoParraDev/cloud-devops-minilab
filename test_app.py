"""
Simple tests for the FastAPI application
Run with: python test_app.py
"""
import requests
import sys
import time

BASE_URL = "http://localhost:8000"

def test_root_endpoint():
    """Test the root endpoint"""
    print("Testing root endpoint...")
    response = requests.get(f"{BASE_URL}/")
    assert response.status_code == 200
    data = response.json()
    assert "message" in data
    print("✅ Root endpoint working")
    return True

def test_health_endpoint():
    """Test the health check endpoint"""
    print("Testing health endpoint...")
    response = requests.get(f"{BASE_URL}/health")
    assert response.status_code == 200
    data = response.json()
    assert data["status"] == "healthy"
    print("✅ Health check endpoint working")
    return True

def test_info_endpoint():
    """Test the info endpoint"""
    print("Testing info endpoint...")
    response = requests.get(f"{BASE_URL}/info")
    assert response.status_code == 200
    data = response.json()
    assert "hostname" in data
    print("✅ Info endpoint working")
    return True

def wait_for_server(max_retries=10):
    """Wait for the server to be ready"""
    for i in range(max_retries):
        try:
            requests.get(f"{BASE_URL}/health")
            return True
        except requests.exceptions.ConnectionError:
            print(f"Waiting for server... ({i+1}/{max_retries})")
            time.sleep(2)
    return False

def main():
    print("🚀 Starting application tests...\n")
    
    # Wait for server
    if not wait_for_server():
        print("❌ Server is not responding")
        sys.exit(1)
    
    print("✅ Server is ready\n")
    
    # Run tests
    tests = [
        test_root_endpoint,
        test_health_endpoint,
        test_info_endpoint,
    ]
    
    failed = 0
    for test in tests:
        try:
            test()
        except AssertionError as e:
            print(f"❌ Test failed: {e}")
            failed += 1
        except Exception as e:
            print(f"❌ Error: {e}")
            failed += 1
    
    print(f"\n{'='*50}")
    if failed == 0:
        print("🎉 All tests passed!")
        sys.exit(0)
    else:
        print(f"❌ {failed} test(s) failed")
        sys.exit(1)

if __name__ == "__main__":
    main()

