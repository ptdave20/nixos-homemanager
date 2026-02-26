{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./firefox.nix
    ./obs.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ptdave";
  home.homeDirectory = "/home/ptdave";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Git
  programs.git = {
    enable    = true;
    settings  = {
      user    = {
        name  = "ptdave";
        email = "ptdave20@gmail.com";
      };
    };

  };

  # Install firefox.
  programs.firefox.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    go
    oh-my-zsh
    kdePackages.kate
    kdePackages.kcalc
    bats
    ytmdesktop
    heroic
    lutris
    protonup-qt
    discord
    proton-pass
    protonmail-bridge
    proton-authenticator
    boatswain
    streamcontroller
    ani-cli
  ];

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
  #  /etc/profiles/per-user/ptdave/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nano";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
