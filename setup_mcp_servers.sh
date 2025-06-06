#!/usr/bin/env bash
set -euo pipefail

# Directory containing Google credentials
CREDENTIAL_DIR="$HOME/.config/gcp"

# Server Filesystem
docker run -d -p 9999:9999 ghcr.io/modelcontextprotocol/server-filesystem

# Windows Everything search
docker run -d -p 9000:9000 ghcr.io/mamertofabian/mcp-everything-search:latest

# Document to Markdown converter
docker run -d -p 9100:9100 mcr.microsoft.com/markitdown:latest

# DICOM MCP server (map to local port 9200)
docker run -d -p 9200:8080 ghcr.io/christianhinge/dicom-mcp:latest

# SQLite server
docker run -d -p 9400:8080 ghcr.io/modelcontextprotocol/server-sqlite

# Google Calendar
docker run -d -p 9300:8080 -v "$CREDENTIAL_DIR:/gcp:ro" ghcr.io/nspady/google-calendar-mcp:latest

# Google Drive
docker run -d -p 9500:8080 -v "$CREDENTIAL_DIR:/gcp:ro" ghcr.io/felores/gdrive-mcp-server:latest

# Google Docs MCP (pip based)
pip install -q google-docs-mcp
nohup google-docs-mcp --port 9600 &

# Google Sheets
docker run -d -p 9700:9300 -v "$CREDENTIAL_DIR:/gcp:ro" xing5/mcp-google-sheets:latest

# Gmail MCP (npm based)
npm i -g gmail-mcp-server
nohup gmail-mcp --port 9800 &

# Google Slides
docker run -d -p 9900:8080 -v "$CREDENTIAL_DIR:/gcp:ro" ghcr.io/matteoantoci/google-slides-mcp:latest

