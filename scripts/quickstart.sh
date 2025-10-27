#!/bin/bash

# Quick Start Script for Cloud DevOps MiniLab
# This script helps you get started quickly

echo "🚀 Cloud DevOps MiniLab - Quick Start"
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check Docker
echo "Checking prerequisites..."
if command -v docker &> /dev/null; then
    echo -e "${GREEN}✅ Docker found: $(docker --version)${NC}"
else
    echo -e "${RED}❌ Docker not found. Please install Docker.${NC}"
    exit 1
fi

# Check Docker daemon
if docker ps &> /dev/null; then
    echo -e "${GREEN}✅ Docker is running${NC}"
else
    echo -e "${RED}❌ Docker daemon is not running. Please start Docker.${NC}"
    exit 1
fi

echo ""
echo -e "${YELLOW}Starting deployment with Docker Compose...${NC}"
echo ""

# Build and start
docker-compose up -d --build

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ Deployment successful!${NC}"
    echo ""
    echo "📍 Application URLs:"
    echo "   - API: http://localhost:8000"
    echo "   - Health: http://localhost:8000/health"
    echo "   - Docs: http://localhost:8000/docs"
    echo ""
    echo "To view logs: docker-compose logs -f"
    echo "To stop: docker-compose down"
    echo ""
    
    # Wait for app to start
    sleep 5
    
    # Test the application
    echo "Testing application..."
    if curl -f -s http://localhost:8000/health > /dev/null; then
        echo -e "${GREEN}✅ Application is responding!${NC}"
    else
        echo -e "${YELLOW}⚠️  Application might still be starting. Check logs with: docker-compose logs -f${NC}"
    fi
else
    echo -e "${RED}❌ Deployment failed${NC}"
    exit 1
fi

