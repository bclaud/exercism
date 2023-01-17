{
  description = "exercism shell";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
    devshell-flake = { url = "github:numtide/devshell"; };
  };

  outputs = { self, nixpkgs, flake-utils, devshell-flake }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        inherit (nixpkgs.lib) optional;
        pkgs = import nixpkgs {
          inherit system;
          # overlays = [devshell-flake.overlay];
        };
      in

      with pkgs;
      { devShell = callPackage ./shell.nix { }; }
    );
}
