{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter."${system}" = pkgs.nixfmt-tree;

      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [
          gcc
          go
        ];
        shellHook = ''
          export GOROOT="${pkgs.go}/share/go"
          export GOPATH="$HOME/go"
          export CGO_ENABLED=1

          go install github.com/go-delve/delve/cmd/dlv@latest
          go get github.com/duckdb/duckdb-go/v2
        '';
      };
    };
}
