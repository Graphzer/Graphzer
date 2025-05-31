.PHONY: build run help scan clean

# Build the Docker image
build:
	docker build -t graphzer .

# Run with help
run: build
	docker run --rm graphzer --help

# Interactive help
help: build
	docker run --rm graphzer --help

# Quick scan example
scan: build
	docker run --rm -v $(PWD):/data graphzer -d example.com

# Clean up
clean:
	docker rmi graphzer 2>/dev/null || true

# Install alias (adds to current shell)
alias:
	@echo "Add this to your ~/.bashrc or ~/.zshrc:"
	@echo "alias graphzer='docker run --rm -v \$$(pwd):/data graphzer'"

# One-line setup
install: build
	@echo "✅ GraphZer installed successfully!"
	@echo ""
	@echo "Quick usage:"
	@echo "  docker run --rm graphzer -d example.com"
	@echo "  docker run --rm -v \$$(pwd):/data graphzer -f /data/domains.txt"
	@echo ""
	@echo "Or create an alias with: make alias"