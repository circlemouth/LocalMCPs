# LocalMCPs

このリポジトリには、各種 Model Context Protocol (MCP) サーバーをローカル環境に展開するためのスクリプト `setup_mcp_servers.sh` が含まれています。Docker と WSL2 が利用できる環境を前提としています。

## 使い方

1. Google 認証情報を `$HOME/.config/gcp/credentials.json` に配置します。
2. `setup_mcp_servers.sh` を実行して各 MCP サーバーを起動します。

```bash
./setup_mcp_servers.sh
```

スクリプトでは各サービスを以下のポートにバインドします。

- 9999: server-filesystem
- 9000: mcp-everything-search
- 9100: markitdown
- 9200: dicom-mcp
- 9400: server-sqlite
- 9300: google-calendar-mcp
- 9500: gdrive-mcp-server
- 9600: google-docs-mcp
- 9700: mcp-google-sheets
- 9800: gmail-mcp-server
- 9900: google-slides-mcp

Google 系サービスでは、認証情報を `/gcp` に読み取り専用でマウントしています。
