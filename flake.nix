{
  description = "Outline VPN manager app";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      packages."${system}".default =
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          pname = "outline-vpn-manager";
          version = "1.18.0";
          src = pkgs.fetchurl {
            url = "https://web.archive.org/web/20251024124534if_/https://s3.amazonaws.com/outline-releases/manager/linux/stable/Outline-Manager.AppImage";
            hash = "sha256-n0HCaXUJ/2SAd15IKJBlQ4exwF/U0UsNiL5W4FeHVYI=";
          };
        in
        pkgs.appimageTools.wrapType2 {
          inherit pname version src;
        };
    };
}
