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
          go
          gcc
          delve
        ];
      };
    };
}
