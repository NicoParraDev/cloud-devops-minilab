from fastapi import FastAPI
import uvicorn
import os

app = FastAPI(
    title="Whitestack Demo API",
    description="A simple demo API for DevOps practice",
    version="1.0.0"
)

@app.get("/")
def read_root():
    """Root endpoint with welcome message"""
    return {
        "message": "Hola Whitestack!",
        "status": "running",
        "version": "1.0.0"
    }

@app.get("/health")
def health_check():
    """Health check endpoint"""
    return {
        "status": "healthy",
        "service": "whitestack-demo"
    }

@app.get("/info")
def get_info():
    """Get environment information"""
    return {
        "hostname": os.getenv("HOSTNAME", "localhost"),
        "environment": os.getenv("ENV", "development"),
        "python_version": os.sys.version
    }

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)

