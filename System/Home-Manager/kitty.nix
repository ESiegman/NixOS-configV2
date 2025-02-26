# System/Home-Manager/kitty.nix

{ ... }:

{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+u" = "kitten open_url";
    };
    settings = {
      enable_ligatures = true;
      scrollback_lines = 10000;
      detect_urls = true;
      enable_audio_bell = true;
      scrolling_smooth = true;
      tab_bar_style = "powerline";
      term = "xterm-kitty";
      hardware_acceleration = "yes";
    };
  };
}
