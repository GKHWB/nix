{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
  mpv,
  nix-update-script,
  writableTmpDirAsHomeHook,
}:

rustPlatform.buildRustPackage rec {
  pname = "jellyfin-tui";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "dhonus";
    repo = "jellyfin-tui";
    tag = "v${version}";
    hash = "sha256-9TSg7J5Pbb2cpL9fEMs5ZJjmA70o8TEmbDkYIK2inTc=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-dFUUJovJcf5pzH9nta7G+E7hcZTZONLPgQ1HAX4RYrY=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    openssl
    mpv
  ];

  doInstallCheck = true;
  installCheckInputs = [
    writableTmpDirAsHomeHook
  ];
  installCheckPhase = ''
    mkdir -p $HOME/.local/share
    versionOutput="$($out/bin/jellyfin-tui --version | cut -d " " -f 1,2)"
    if [[ $versionOutput != *"$version"* ]]; then
      echo "Did not find $version in $versionOutput"
      exit 3
    fi
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Jellyfin music streaming client for the terminal";
    mainProgram = "jellyfin-tui";
    homepage = "https://github.com/dhonus/jellyfin-tui";
    changelog = "https://github.com/dhonus/jellyfin-tui/releases/tag/v${version}";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ GKHWB ];
  };
}
