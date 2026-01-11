#!/bin/bash

# Stop the Claude development environment

echo "🛑 Stopping Claude development environment..."

docker-compose down

if [ $? -eq 0 ]; then
    echo "✅ Container stopped successfully!"
else
    echo "❌ Failed to stop container!"
    exit 1
fi
