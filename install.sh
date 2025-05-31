#!/bin/bash
# GraphZer One-Line Docker Installation

echo "Building GraphZer Docker image..."
docker build -t graphzer .

echo ""
echo "✅ Installation complete!"
echo ""
echo "Usage examples:"
echo "  docker run --rm graphzer -d example.com"
echo "  docker run --rm -v \$(pwd):/data graphzer -f /data/domains.txt"
echo "  docker run --rm graphzer --help"
echo ""
echo "To create an alias for easier use:"
echo "  alias graphzer='docker run --rm -v \$(pwd):/data graphzer'"
echo "  graphzer -d example.com"
