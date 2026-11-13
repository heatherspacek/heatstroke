let
  # We pin to a specific nixpkgs commit for reproducibility.
  # Last updated: 2026-09-06. Check for new commits at https://status.nixos.org.
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/17de0b976395537756f30a3e78f2f06e5cec89ed.tar.gz") {};
in
pkgs.mkShell {
  buildInputs = [
    (pkgs.openscad.withPackages (ps: [ ps.bosl2 ]))
  ];
}
