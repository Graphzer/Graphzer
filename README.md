# Graphzer

Advanced GraphQL endpoint discovery and analysis tool with precision domain scanning capabilities.

## Features

- **Single Domain Analysis**: Detailed endpoint discovery with full results
- **Bulk Domain Scanning**: Clean output showing only domains with findings  


## Installation

### Docker (Recommended)
```bash
# One-line install and run
docker build -t graphzer . && docker run --rm graphzer --help
```

### Local Installation using Poetry
```bash
# Install Poetry and configure environment
curl -sSL https://install.python-poetry.org | python3 -
export PATH="$HOME/.local/bin:$PATH"
poetry self add poetry-plugin-shell
# Verify Poetry installation
poetry --version
```
```
# Install Graphzer (Make sure you've installed poetry)
git clone <repository>
cd graphzer
poetry install
graphzer

```

## Usage

### Single Domain Scan
```bash
# Docker
docker run --rm graphzer -d example.com

# Python
python -m graphzer -d example.com
```

### Bulk Domain Scan
```bash
# Create domains.txt with one domain per line, then:

# Docker
docker run --rm -v $(pwd):/data graphzer -f /data/domains.txt

# Python  
python -m graphzer -f domains.txt
```

### Save Results
```bash
# Docker
docker run --rm -v $(pwd):/data graphzer -d example.com -o /data/results.txt

# Python
python -m graphzer -d example.com -o results.txt
```

## Output Examples

### Single Domain Mode
```
    ╔══════════════════════════════════════════════════════╗
    ║                   ANALYSIS RESULTS                   ║
    ╚══════════════════════════════════════════════════════╝

    ╭─ Domain: example.com
    ├─ Endpoints Found: 2
    ├─ GraphQL Endpoints:
    │  └─ https://example.com/api/graphql
    │  └─ https://example.com/graphql
    ╰─────────────────────────────────────────
```

### Bulk Domain Mode
```
    ╔══════════════════════════════════════════════════════╗
    ║                  DISCOVERED DOMAINS                  ║
    ╚══════════════════════════════════════════════════════╝

    ┌─ example.com
    └─ 2 GraphQL endpoints detected

    ┌─ api.github.com  
    └─ 1 GraphQL endpoints detected

    ╔══════════════════════════════════════════════════════╗
    ║     SCAN COMPLETE: 2 domains with endpoints         ║
    ╚══════════════════════════════════════════════════════╝
```

## Command Line Options

```
Options:
  -d, --domain DOMAIN           Domain to scan
  -f, --file INPUT_FILE         File with domain list (one per line)
  -o, --output-file OUTPUT_FILE Output results to file
  --precision                   Enable precision mode
  --quiet                       Suppress output
  --verbose                     Verbose logging
  --help                        Show help message
```

## Docker Alias (Recommended)

Add to your `~/.bashrc` or `~/.zshrc`:
```bash
alias graphzer='docker run --rm -v $(pwd):/data graphzer'
```

Then use normally:
```bash
graphzer -d example.com
graphzer -f domains.txt
```

## Requirements

- Python 3.8+ with Poetry (for direct installation)
- Docker (for containerized usage)
