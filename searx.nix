{
  # Enable SearXNG
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    settings.server.secret_key = "test";
    settings.server.port = "8080";
    settings.server.bind_address = "0.0.0.0";
  };
}
