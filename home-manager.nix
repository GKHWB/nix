{
  home-manager = {
     users = {
        "alter" = import ./home/home-alter.nix;
     };
     sharedModules = [{
     }];
  };
}
