{ self, inputs, ...}: {

  flake.nixosModules.asylumHardware = { config, lib, pkgs, modulesPath, ... }:

  {
    imports =
      [ (modulesPath + "/installer/scan/not-detected.nix")
      ];
  
    boot.initrd.availableKernelModules = [ "ehci_pci" "ata_piix" "uhci_hcd" "hpsa" "usb_storage" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];
  
    fileSystems."/" =
      { device = "/dev/disk/by-uuid/73800a41-cc09-4f34-aded-faee25f95a2c";
        fsType = "ext4";
      };

    fileSystems."/mnt" =
      { device = "/dev/disk/by-uuid/a511e816-5d67-41b3-9684-08ce2a22448d";
        fsType = "ext4";
      };
  
    swapDevices = [ ];
  
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

}
