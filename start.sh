#!/bin/bash

# Start the Claude development environment

echo "🚀 Starting Claude development environment..."

docker-compose up -d

if [ $? -eq 0 ]; then
    echo "✅ Container started successfully!"
    echo ""
    echo "Container name: claude-dev-env"
    echo ""
    echo "To enter the container:"
    echo "  ./exec.sh"
    echo ""
    echo "To view logs:"
    echo "  docker-compose logs -f"
    echo ""
    echo "To stop:"
    echo "  ./stop.sh"
else
    echo "❌ Failed to start container!"
    exit 1
fi
