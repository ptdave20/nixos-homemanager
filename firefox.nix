{ config, pkgs, ... }:

{
  # Install firefox.
  programs.firefox = {
    enable = true;
    policies = {
      DisableFirefoxStudies         = true;
      DisablePocket                 = true;
      DisableTelemetry              = true;

      DontCheckDefaultBrowser       = true;



      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        #"*".installation_mode = "blocked";

        "uBlock0@raymondhill.net" = {
          install_url       = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled  = true;
        };

        "{22b0eca1-8c02-4c0d-a5d7-6604ddd9836e}" = {
          install_url       = moz "nicothin-space";
          installation_mode = "force_installed";
          updates_disabled  = true;
        };

#         "{73a6fe31-595d-460b-a920-fcc0f8843232}" = {
#           install_url       = moz "noscript";
#           installation_mode = "force_installed";
#           updates_disabled  = true;
#         };

        "{631d447a-17e8-43af-b541-3bf88cb55800}" = {
          install_url       = moz "twitch-auto-claim";
          installation_mode = "force_installed";
          updates_disabled  = false;
        };

        "{78272b6fa58f4a1abaac99321d503a20@proton.me}" = {
          install_url       = moz "proton-pass";
          installation_mode = "force_installed";
          updates_disabled  = false;
        };

        "{vpn@proton.ch}" = {
          install_url       = moz "proton-vpn-firefox-extension";
          installation_mode = "force_installed";
          updates_disabled  = false;
        };
      };
    };
  };

}
