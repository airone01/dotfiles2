{
  lib,
  config,
  ...
}: let
  cfg = config.stars;
in {
  imports = [
    # unconditinal
    ./core

    # conditional
    ./personal
    ./gui
  ];

  options.stars = {
    enable = lib.mkEnableOption "Enable stars framework";

    userName = lib.mkOption {
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "password1234";
      description = "main user";
      extraGroups = ["networkmanager" "wheel"];
    };
  };
}