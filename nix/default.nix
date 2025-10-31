{
  rev,
  stdenv,
  lib,
  cmake,
  pkg-config,
  hidapi,
  debug ? false,
}: let
  version = "0.1.0";
in
  stdenv.mkDerivation {
    pname = "apdbctl";
    inherit version;

    src = ./..;

    nativeBuildInputs = [
      cmake
      pkg-config
    ];

    buildInputs = [
      hidapi
    ];

    cmakeFlags = [
      (lib.cmakeFeature "VERSION" version)
      (lib.cmakeFeature "GIT_REVISION" rev)
      (lib.cmakeFeature "DISTRIBUTOR" "nix-flake")
    ];

    cmakeBuildType =
      if debug
      then "Debug"
      else "RelWithDebInfo";

    dontStrip = debug;

    meta = with lib; {
      description = "Apple Pro Display XDR Brightness control";
      license = licenses.mit;
      platforms = platforms.unix;
    };
  }
