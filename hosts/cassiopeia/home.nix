{pkgs, ...}: {
  imports = [
    # cli
    ../../modules/zsh.nix
    ../../modules/oh-my-posh.nix
    ../../modules/btop.nix
  ];

  home = {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    username = "r1";
    homeDirectory = "/home/r1";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      # other
      ## hello world command
      hello
      ## screenshot tool
      grimblast

      # shells
      zellij

      # utils
      neofetch
      pfetch

      # networking
      atac
      networkmanagerapplet

      # fs management
      eza

      # terminal emulator
      kitty

      # file managers
      kdePackages.dolphin

      # media players
      vlc

      # text editors & ide
      vscode
      ## language servers
      nil

      # internet browser
      firefox
      google-chrome

      # github helper
      gh

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/r1/etc/profile.d/hm-session-vars.sh
    #
    sessionVariables = {
      # text editor
      EDITOR = "nvim";
      # wayland
      ## if the cursor becomes invisible
      WLR_NO_HARDWARE_CURSORS = "1";
      ## tell electron apps to use wayland
      NIXOS_OZONE_WL = "1";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
