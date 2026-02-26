{ config, pkgs, ... }:

{
  # Install obs-studio
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins;[
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi
      obs-gstreamer
      obs-vkcapture
      obs-tuna
      waveform
      pixel-art
      obs-markdown
      droidcam-obs
      obs-3d-effect
      input-overlay
      obs-multi-rtmp
      obs-mute-filter
      obs-retro-effects
      obs-composite-blur
      obs-scale-to-sound
      obs-advanced-masks
      obs-gradient-source
      obs-stroke-glow-shadow
    ];
  };
}
