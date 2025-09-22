# portable-node-mcp-runner

batファイルを使う意味はほぼないかもしれません．代わりにportable版のnpx.cmdを直接commandに指定すればいい可能性があります．
リポジトリ自体はexampleの記載例としてだけ残しておきます．

Small helper repo to run MCP servers (Notion, Zotero) from a portable Node distribution on Windows。

ドキュメント，コードはAIアシスタントにより生成されました。内容の正確性は保証されません。

## 概要

このリポジトリは、ポータブルNode.jsディストリビューションを使用してMCPサーバー（Notion、Zoteroなど）を実行するための小さなヘルパーリポジトリです。
[mcp-remote](https://github.com/geelen/mcp-remote)を利用しています．

## クイックスタート

1. ポータブルNode.jsディストリビューションをこのフォルダーに配置します。（例: `./node-v20.5.1-win-x64`）。このディレクトリには`node.exe`と`npm`等が含まれている必要があります。
2. `portable-npx.bat`内の`SET "NODE_DIR=%SCRIPT_DIR%\node-v20.5.1-win-x64"`の部分を、実際のNodeディレクトリ名に合わせて変更します。
3. `portable-npx.bat`を使用して、外部アプリ（Claude Desktop、VS Code）から確実に`npx`を呼び出します。これにより、`node.exe`が`PATH`に追加され、ローカル`npm`キャッシュ/プレフィックスが設定されます。
4. Claude Desktopの設定例: `examples/claude_desktop_config.json`

## ディレクトリ構成例

このリポジトリをポータブル Node.js と一緒に使う際の推奨ディレクトリ構成の例を示します。実際のパス名は環境に合わせて置き換えてください。

例:

```text
mcp-proxy/                        # このリポジトリ
├─ portable-npx.bat               # ポータブル Node を PATH に設定して npx を呼ぶラッパー
├─ README.md
├─ examples/
│  ├─ claude_desktop_config.json
│  └─ mcp.json
└─ node-vXX.YY.ZZ-win-x64/        # ポータブル Node ディストリ（例: node-v22.19.0-win-x64）
   ├─ node.exe
   ├─ npm
   ├─ npx
   └─ npm-cache/                  # ローカル npm キャッシュ/プレフィックス
```

ポイント:

- `portable-npx.bat` は同じディレクトリにあるポータブル Node を参照するようにしておくと便利です（README のクイックスタート参照）。
- `node-vXX.YY.ZZ-win-x64` をリポジトリ内に配置すると、外部アプリ（例: Claude Desktop、VS Code）の設定で絶対パスを指定しやすくなります。

## Examples

このリポジトリの `examples/claude_desktop_config.json` は、起動コマンドと引数をわかりやすく示すためにフルパス形式のプレースホルダを使用しています。実際に利用する際は次のように置き換えてください:

- `C:\\full\\path\\to\\portable-npx.bat` → 実際の `portable-npx.bat` の絶対パス（例: `C:\\Users\\you\\Workspace\\mcp\\mcp-proxy\\portable-npx.bat`）
- `C:\\full\\path\\to\\project` → プロジェクトの作業ディレクトリ（workingDirectory）に設定する絶対パス
- `https://<addr>/mcp` → リモートMCPエンドポイントのURL（例: `https://mcp.example.com/mcp`）

例ファイルにはローカル用（`http://localhost:9999/mcp`）とリモート用（`https://<addr>/mcp`）の2エントリがあります。環境に合わせて `command` と `args` を更新して使用してください。
