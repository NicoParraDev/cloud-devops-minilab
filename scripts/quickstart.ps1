# PowerShell Quick Start Script for Cloud DevOps MiniLab
# Run this script to get started quickly

Write-Host "🚀 Cloud DevOps MiniLab - Quick Start" -ForegroundColor Green
Write-Host ""

# Check if Docker is installed and running
Write-Host "Checking prerequisites..." -ForegroundColor Yellow

# Check Docker
try {
    $dockerVersion = docker --version 2>&1
    Write-Host "✅ Docker found: $dockerVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker not found. Please install Docker Desktop." -ForegroundColor Red
    Write-Host "Download from: https://www.docker.com/products/docker-desktop" -ForegroundColor Yellow
    exit 1
}

# Check if Docker is running
try {
    docker ps 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        throw "Docker daemon not running"
    }
    Write-Host "✅ Docker is running" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker daemon is not running. Please start Docker Desktop." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Starting deployment with Docker Compose..." -ForegroundColor Yellow
Write-Host ""

# Build and start containers
docker-compose up -d --build

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Deployment successful!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📍 Application URLs:" -ForegroundColor Cyan
    Write-Host "   - API: http://localhost:8000" -ForegroundColor White
    Write-Host "   - Health: http://localhost:8000/health" -ForegroundColor White
    Write-Host "   - Docs: http://localhost:8000/docs" -ForegroundColor White
    Write-Host ""
    Write-Host "To view logs: docker-compose logs -f" -ForegroundColor Yellow
    Write-Host "To stop: docker-compose down" -ForegroundColor Yellow
    Write-Host ""
    
    # Wait a bit for the app to start
    Start-Sleep -Seconds 5
    
    # Test the application
    Write-Host "Testing application..." -ForegroundColor Yellow
    try {
        $response = Invoke-WebRequest -Uri "http://localhost:8000/health" -Method Get -TimeoutSec 5
        Write-Host "✅ Application is responding!" -ForegroundColor Green
    } catch {
        Write-Host "⚠️  Application might still be starting. Check logs with: docker-compose logs -f" -ForegroundColor Yellow
    }
    
} else {
    Write-Host "❌ Deployment failed. Check error messages above." -ForegroundColor Red
    exit 1
}

