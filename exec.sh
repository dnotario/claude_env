#!/bin/bash

# Enter the Claude development environment

echo "🔌 Connecting to Claude development environment..."

# Check if container is running
if [ "$(docker ps -q -f name=claude-dev-env)" ]; then
    docker exec -it claude-dev-env /bin/bash
else
    echo "❌ Container is not running!"
    echo ""
    echo "Start the container first:"
    echo "  ./start.sh"
    exit 1
fi
