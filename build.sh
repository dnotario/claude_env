#!/bin/bash

# Build the Claude development environment

echo "🏗️  Building Claude development environment..."

# Create workspace directory if it doesn't exist
mkdir -p workspace

# Build the Docker image
docker-compose build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "Next steps:"
    echo "  ./start.sh  - Start the container"
    echo "  ./exec.sh   - Enter the container"
else
    echo "❌ Build failed!"
    exit 1
fi
