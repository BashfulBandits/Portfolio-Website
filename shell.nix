{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.openssl
    pkgs.pkg-config
  ];

  packages = with pkgs; [
    tailwindcss typescript nodejs
  ];
  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.openssl}/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=${pkgs.pkg-config}/lib:$LD_LIBRARY_PATH
  '';
}
