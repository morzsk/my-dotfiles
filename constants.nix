{
  hosts = {
    pc     = "pc";
    laptop = "laptop";
  };

  user = {
    name = "mo";
    home = "/home/mo";
  };

  system = "x86_64-linux";

  stateVersion = "24.05";

  paths = {
    hosts = ./hosts;
    modules = {
      user   = ./modules/user;
      system = ./modules/system;
      shared = ./modules/shared;
    };
  };
}
