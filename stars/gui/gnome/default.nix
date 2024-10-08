{
  pkgs,
  lib,
  config,
  ...
}: let
  gnomeStar = lib.mkStar {
    name = "gnome";
    packages = with pkgs; [
      gnomeExtensions.appindicator # subtray icons
      gnomeExtensions.blur-my-shell # blurs your shell
      gnomeExtensions.gsconnect # KDE connect on GNOME
      gnomeExtensions.dock-from-dash # Apple-style dock
      # themes
      flat-remix-gtk
      kora-icon-theme
      # additional software
      themechanger
    ];

    extraConfig = {
      services = {
        # X11 server config
        xserver = {
          enable = true;
          displayManager.gdm.enable = true;
          desktopManager.gnome.enable = true;
        };
        # UDEV rules
        udev.packages = with pkgs; [gnome.gnome-settings-daemon];
        # Patch for GNOME2 applications
        dbus.packages = with pkgs; [gnome2.GConf];
      };
    };

    extraHomeConfig = {
      dconf = {
        enable = true;
        # GNOME shell settings
        settings."org/gnome/shell" = {
          disable-user-extensions = false;
          enable-extensions = with pkgs.gnomeExtensions; [
            blur-my-shell.extensionUuid
            gsconnect.extensionUuid
            dock-from-dash.extensionUuid
            user-themes.extensionUuid
          ];
        };
        # GNOME default color scheme
        settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
      };
      # GTK themes
      gtk = {
        theme = {
          package = pkgs.flat-remix-gtk;
          name = "Flat Remix GTK Dark";
        };
        iconTheme = {
          package = pkgs.kora-icon-theme;
          name = "Kora";
        };
      };
    };
  };
in {
  imports = [gnomeStar];

  config.stars.pipewire = lib.mkIf config.stars.gnome.enable {enable = lib.mkDefault true;};
}
