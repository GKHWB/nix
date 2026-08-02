let
  cradle = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDComyuKhWoZsOmRyn+MgyTJ5zJjDpyl2VzASL681qtV";
  amalgam = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILoris0Y3YWDETaG4ivlOMNmB0Wr9aIe24Qt3auG8iYO";
in
{
  "wireguard-endpoint.age".publicKeys = [ cradle amalgam ];
}

