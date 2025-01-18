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
  version = "v1.0.6";

  src = fetchFromGitHub {
    owner = "dhonus";
    repo = pname;
    rev = version;
    hash = "sha256-IjXfOYoqzNiyZVbY+J9GSjF7dZ4ZxmlifM5EApEODOo=";
  };

  cargoHash = "sha256-tOt92y7LNbTvY2NNVm4GwC+XdJe1sn4T49ByS10G/cs=";

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
