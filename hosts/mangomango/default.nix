{
  imports = [
    # Include the results of the hardware scan.
    ../../modules/system.nix
    ../../modules/plasma.nix
    ../../modules/ssd.nix
    ../../modules/logitech.nix
    ../../modules/docker.nix
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # disable integrated amd gpu (interfering with nvidia)
  boot.kernelParams = ["i915.force_probe=7d45" "i915.enable_psr=0"];

  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = 524288; # default: 8192
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  networking.hostName = "mangomango"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
