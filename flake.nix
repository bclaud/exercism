{
  description = "exercism shell";

  inputs = {
    nixpkgs = {url = "github:NixOS/nixpkgs/nixpkgs-unstable";};
    flake-utils = {url = "github:numtide/flake-utils";};
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        inherit (nixpkgs.lib) optional;
        pkgs = import nixpkgs {
          inherit system;
          # overlays = [devshell-flake.overlay];
        };
      in
        with pkgs; {devShell = callPackage ./shell.nix { };}
    );
}
