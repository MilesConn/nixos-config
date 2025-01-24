{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.=
  users.users.miles = {
    isNormalUser = true;
    description = "Miles Conn";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
      caffeine-ng
      # TODO: consolidate these in a certain place
      kdePackages.yakuake
      #  thunderbird
    ];
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["root" "miles"];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    lm_sensors
    nnn
    ripgrep
    wget
    zoxide
    xclip
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    # wayland
    vulkan-loader
    # vulkan-validation-layers
    # libGL
  ];

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
    ];
  };

  environment.shells = with pkgs; [nushell zsh];

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  programs.nano.enable = false;

  programs.nix-ld.enable = true;

  services.avahi.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
