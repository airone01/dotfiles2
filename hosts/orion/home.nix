{pkgs, ...}: {
  imports = [
    # cli
    ../../modules/zsh.nix
    ../../modules/oh-my-posh.nix
    ../../modules/btop.nix

    # gui
    #../../modules/wayland.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "r1";
  home.homeDirectory = "/home/r1";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # other
    ## hello world command
    pkgs.hello
    ## screenshot tool
    pkgs.grimblast

    # shells
    pkgs.zellij

    # utils
    pkgs.neofetch
    pkgs.pfetch

    # networking
    pkgs.atac
    pkgs.networkmanagerapplet

    # fs management
    pkgs.eza

    # terminal emulator
    pkgs.kitty

    # file managers
    pkgs.kdePackages.dolphin

    # media players
    pkgs.vlc

    # text editors & ide
    pkgs.neovim
    pkgs.vscode
    ## language servers
    pkgs.nil

    # internet browser
    pkgs.firefox
    pkgs.google-chrome

    # github helper
    pkgs.gh

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # xdg
  #xdg.portal = {
  #  enable = true;
  #  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #};

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

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
  home.sessionVariables = {
    # text editor
    EDITOR = "nvim";
    # wayland
    ## if the cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    ## tell electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
