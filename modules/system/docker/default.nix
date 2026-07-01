{ constants, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  users.users.${constants.user.name}.extraGroups = [ "docker" ];
}
