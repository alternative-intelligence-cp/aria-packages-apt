# aria-packages-apt

APT repository infrastructure for the [Aria programming language](https://github.com/alternative-intelligence-cp/aria).

## Overview

This repo manages the Debian/Ubuntu APT package repository hosted at `packages.ariax.ai-liberation-platform.org`.

## Packages

| Package | Source Repo | Contents |
|---------|-----------|----------|
| `aria` | [aria](https://github.com/alternative-intelligence-cp/aria) | Compiler, LSP, stdlib, aria-pkg, aria-doc |
| `aria-tools` | [aria-tools](https://github.com/alternative-intelligence-cp/aria-tools) | aria-safety, aria-mcp |
| `aria-man-pages` | [aria-docs](https://github.com/alternative-intelligence-cp/aria-docs) | Man pages |
| `aria-packages` | [aria-packages](https://github.com/alternative-intelligence-cp/aria-packages) | Ecosystem packages |
| `aria-archive-keyring` | This repo | GPG key for APT verification |

## User Setup

```bash
curl -fsSL https://packages.ariax.ai-liberation-platform.org/setup-repo.sh | sudo bash
sudo apt install aria
```

Or manually:
```bash
curl -fsSL https://packages.ariax.ai-liberation-platform.org/aria-archive-keyring.gpg | \
    sudo gpg --dearmor -o /usr/share/keyrings/aria-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/aria-archive-keyring.gpg] https://packages.ariax.ai-liberation-platform.org noble main" | \
    sudo tee /etc/apt/sources.list.d/aria.list
sudo apt update && sudo apt install aria
```

## Maintainer Workflow

```bash
# Build a .deb
scripts/build-compiler-deb.sh /path/to/aria

# Add to repo
scripts/update-repo.sh aria_0.2.2-1_amd64.deb

# Publish to web server
scripts/publish.sh
```

## Structure

```
conf/           - reprepro configuration
keys/           - GPG keyring and signing scripts
scripts/        - Build, update, and publish scripts
```

## License

AGPL-3.0 — see [LICENSE.md](LICENSE.md)
