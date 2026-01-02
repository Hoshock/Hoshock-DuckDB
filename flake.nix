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
          delve
          gcc
          go
          gopls
        ];
        env = {
          GOROOT = "${pkgs.go}/share/go";
          CGO_ENABLED = "1";
        };
        shellHook = ''
          export XDG_CONFIG_HOME="$HOME/.config"
          export XDG_STATE_HOME="$HOME/.local/state"
          export XDG_CACHE_HOME="$HOME/.cache"
          export XDG_DATA_HOME="$HOME/.local/share"
          export XDG_RUNTIME_DIR="/run/user/$UID"

          export GOPATH="$HOME/.local/share/go"
          export GOCACHE="$HOME/.cache/go-build"
          export GOMODCACHE="$HOME/.cache/go/mod"
        '';
      };
    };
}
