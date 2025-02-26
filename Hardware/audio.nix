# Hardware/pulseaudio.nix

{pkgs, ...}: 

{
  environment.systemPackages = with pkgs; [
    pulseaudioFull
  ];

  security.rtkit.enable = true;

  services.pipewire = {
    audio.enable = true;
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    wireplumber.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };
}
