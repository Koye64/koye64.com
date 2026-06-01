{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        (writeShellScriptBin "serve" ''
          ${nixpkgs.lib.getExe' xdg-utils "xdg-open"} "http://localhost:8282/"
          ${nixpkgs.lib.getExe static-web-server} -p 8282 -d ./public -g trace
        '')
      ];
    };
  };
}
