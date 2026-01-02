# Hoshock-DuckDB

Sample DuckDB project with nix + direnv integration.

## Prerequisites

- `nix`
- `direnv`
- vscode extenstions
  - `mkhl.direnv`
  - `golang.go`

> [!NOTE]
> [flake.nix](flake.nix) doesn't include the requisites above because they are installed system-wide in my case.

## Development

1. Run `direnv allow`
2. Open [default.code-workspace](./default.code-workspace) in vscode
