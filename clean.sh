#!/bin/bash

# Clean up the Claude development environment

echo "🧹 Cleaning up Claude development environment..."
echo ""
echo "⚠️  This will:"
echo "  - Stop and remove the container"
echo "  - Remove the Docker image"
echo "  - Remove Docker volumes (bash history)"
echo "  - Keep your workspace files"
echo ""
read -p "Are you sure? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Stop and remove containers
    docker-compose down -v

    # Remove the image
    docker rmi claude_env-claude-dev 2>/dev/null || true

    echo "✅ Cleanup complete!"
    echo ""
    echo "Your workspace files are still in: ./workspace"
    echo "To rebuild: ./build.sh"
else
    echo "Cleanup cancelled."
fi
