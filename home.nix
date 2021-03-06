{ pkgs, lib, config, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "kitty";
  };

  home.packages = import ./packages.nix { inherit pkgs; };

  gtk.enable = true;
  gtk.theme = {
    package = pkgs.sweet;
    name = "Sweet-mars";
  };

  xsession.windowManager.i3 = import ./i3_sway.nix { inherit pkgs lib config; };
  # xsession.windowManager.bspwm = {
  #   enable = true;
  #   monitors.focused = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" ];
  # };

  services = import ./services { inherit pkgs lib; };

  programs = import ./programs { inherit pkgs lib config; };

  home.file = { } // import ./programs/vim/files.nix;
}
