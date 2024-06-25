{
  description = "An experiment at gettings a gsconnect service working on ags";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = [
      "x86_64-linux"
    ];

    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import nixpkgs {inherit system;};
        });
  in {
    packages = forEachSupportedSystem ({pkgs}: {
      gvc = pkgs.callPackage ./nix/gvc-package.nix {};
    });
    devShells = forEachSupportedSystem ({pkgs}: {
      default = pkgs.mkShell {
        packages =
          [self.packages.${pkgs.system}.gvc]
          ++ (with pkgs; [
            gjs
            ags
            bun
            sassc
            wtype
            wl-clipboard
            ydotool
            python312
            python312Packages.pydbus
          ]);
      };
    });
  };
}
