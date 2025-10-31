{
  description = "Apple Pro Display XDR Brightness control";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    forAllSystems = fn:
      nixpkgs.lib.genAttrs nixpkgs.lib.platforms.linux (
        system: fn nixpkgs.legacyPackages.${system}
      );
  in {
    formatter = forAllSystems (pkgs: pkgs.alejandra);

    packages = forAllSystems (pkgs: {
      default = pkgs.stdenv.mkDerivation {
        pname = "apdbctl";
        version = "0.1.0";

        src = ./.;

        nativeBuildInputs = with pkgs; [
          cmake
          pkg-config
        ];

        buildInputs = with pkgs; [
          hidapi
        ];

        meta = with pkgs.lib; {
          description = "Apple Pro Display XDR Brightness control";
          license = licenses.mit;
          platforms = platforms.unix;
        };
      };
    });

    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          cmake
          pkg-config
          hidapi
        ];
      };
    });
  };
}
