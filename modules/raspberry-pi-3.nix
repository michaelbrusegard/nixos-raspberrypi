{ self, lib, pkgs, ... }:

{
  imports = [ ./raspberrypi.nix ];

  boot.loader.raspberryPi = {
    variant = "3";
    bootloader = lib.mkDefault "uboot";
    firmwarePackage = lib.mkDefault self.packages.${pkgs.hostPlatform.system}.raspberrypifw;
  };

  boot.kernelPackages = lib.mkDefault self.packages.${pkgs.hostPlatform.system}.linuxPackages_rpi3;
}
