let
  cradle = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDComyuKhWoZsOmRyn+MgyTJ5zJjDpyl2VzASL681qtV";
  cradleAlter = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILbJ7Nq1zJ8a2Av4lQkzt3F7nxsANtdHRLRDheHC97t7";
  amalgam = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILoris0Y3YWDETaG4ivlOMNmB0Wr9aIe24Qt3auG8iYO";
  dendriticVM = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGVWa4BDDIUi7fqU+5i0v7+zh8FYQaEj3ubClovGGvpI";
  dendriticVMAlter = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKWQAOTg4dllzEUozzK9hxZud/gh3vzxidYhJkv4t0LL";
in
{
  "wireguard-endpoint.age".publicKeys = [ cradle cradleAlter amalgam dendriticVM dendriticVMAlter ];
}

