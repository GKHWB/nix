{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
  mpv,
}:

rustPlatform.buildRustPackage rec {
  pname = "jellyfin-tui";
  version = "v1.0.5";

  src = fetchFromGitHub {
    owner = "dhonus";
    repo = pname;
    rev = version;
    hash = "sha256-dME3oM3k5TGjN8S/93Crt3vw8+KjZWivkVzg+eqwfe4=";
  };

  cargoHash = "sha256-hogGwkaNDE4yPYgmmG9wfDPlNTUaVqlJzCW31lrX6Ic=";

  meta = {
    description = "tui music client for jellyfin";
    homepage = "https://github.com/dhonus/jellyfin-tui";
    license = lib.licenses.gpl3;
    maintainers = [ ];
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ 
    openssl 
    mpv
  ];
}
