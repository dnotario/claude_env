#!/bin/bash

# Install Claude Code in the container

echo "📦 Installing Claude Code..."
echo "This may take a few minutes..."

docker exec claude-dev-env bash -c "sudo npm install -g @anthropic-ai/claude-code"

if [ $? -eq 0 ]; then
    echo "✅ Claude Code installed successfully!"
    echo ""
    echo "To verify, enter the container and run:"
    echo "  ./exec.sh"
    echo "  claude --version"
else
    echo "❌ Failed to install Claude Code!"
    exit 1
fi
