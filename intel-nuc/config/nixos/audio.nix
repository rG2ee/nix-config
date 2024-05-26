{ pkgs, ... }:

{


  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };

  environment.systemPackages = with pkgs; [

    # pulseaudio volume control
    pkgs.pavucontrol
    pkgs.neofetch
  ];


}