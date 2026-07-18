{
  flake.modules.nixos.searxng = {
    services.searx = {
      enable = true;
      redisCreateLocally = true;
      settings = {
        server = {
          secret_key = "test";
          port = "8080";
          bind_address = "0.0.0.0";
        };
      };
    };
  };
}
