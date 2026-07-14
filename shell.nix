{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.openssl
    pkgs.pkg-config
  ];

  packages = with pkgs; [
    tailwindcss typescript nodejs rustup bacon
  ];
  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.openssl}/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=${pkgs.pkg-config}/lib:$LD_LIBRARY_PATH

    echo "front end:"
    echo "npm run dev --"
    echo "back end:"
    echo "cargo run"
  '';
}
