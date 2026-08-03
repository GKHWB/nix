let
  cradle = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDComyuKhWoZsOmRyn+MgyTJ5zJjDpyl2VzASL681qtV";
  cradleAlter = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILbJ7Nq1zJ8a2Av4lQkzt3F7nxsANtdHRLRDheHC97t7";
  amalgam = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILoris0Y3YWDETaG4ivlOMNmB0Wr9aIe24Qt3auG8iYO";
in
{
  "wireguard-endpoint.age".publicKeys = [ cradle cradleAlter amalgam ];
}

