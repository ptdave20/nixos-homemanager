{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      ngc = "sudo nix-collect-garbage -d";
      hmb = "home-manager build";
      hms = "home-manager switch";
    };
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
      "docker"
      "vscode"
      "node"
      "sudo"
    ];
    theme = "cloud";
  };
}
