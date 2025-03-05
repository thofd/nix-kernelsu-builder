_: {
  perSystem =
    { pkgs, ... }:
    let
      sources = pkgs.callPackage _sources/generated.nix { };
    in
    {
      kernelsu = {
        redmi_note_9_pro = {
          anyKernelVariant = "osm0sis";
          clangVersion = "latest";
          kernelSU.variant = "next";
          kernelDefconfigs = [ "vendor/gauguin_user_defconfig" ];
          kernelImageName = "Image";
          kernelSrc = sources.linux-redmi_note_9_pro.src; # sources.linux-oneplus-8t-blu-spark.src
          kernelConfig = ''
            CONFIG_STACKPROTECTOR=n
            CONFIG_LTO_CLANG=y
          '';
        };
      };
    };
}
