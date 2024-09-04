{
  description = "Outline VPN manager app";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
  in {
    packages."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };

      pname = "outline-vpn-manager";
      version = "1.15.2";
      src = pkgs.fetchurl {
        # url = "https://github.com/Jigsaw-Code/outline-apps/releases/download/v${version}/Outline-Client.AppImage";
        url = "https://s3.amazonaws.com/outline-releases/manager/linux/stable/Outline-Manager.AppImage";
        hash = "sha256-/2/8k/c0sBIkz5UKuyCQVqaS44zhtZmhB8xTwcvZTx4=";
      };
    in
      pkgs.appimageTools.wrapType2 {
        inherit pname version src;
      };
  };
}
