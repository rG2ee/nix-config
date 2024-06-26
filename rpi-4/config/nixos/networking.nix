{ lib, ... }:

{


  networking = {
  hostName = "rpi-silver-nixos";

      firewall = {
        allowedTCPPorts = [
          4713 # pulseaudio server
        ];
        allowedUDPPorts = [
          4713 # pulseaudio server
        ];
    };

  };


  # OpenSSH is forced to have an empty `wantedBy` on the installer system[1], this won't allow it
  # to be automatically started. Override it with the normal value.
  # [1] https://github.com/NixOS/nixpkgs/blob/9e5aa25/nixos/modules/profiles/installation-device.nix#L76
  systemd.services.sshd.wantedBy = lib.mkOverride 40 [ "multi-user.target" ];

 services.openssh.enable = true;


}
