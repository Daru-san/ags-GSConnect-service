{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  pkg-config,
  ninja,
  glib,
  cmake,
  libpulseaudio,
  gobject-introspection,
}:
stdenv.mkDerivation {
  pname = "gvc";
  version = "unstable-2023-06-16";

  src = fetchFromGitHub {
    owner = "JingMatrix";
    repo = "gvc";
    rev = "a00aa37b0d9c13970f7b30c308f7e5e8a557181b";
    hash = "sha256-ie6lSrXo/1+6hxS8VhGJc3ARwXhTjvx/pJoCy0jlatA=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    meson
    pkg-config
    cmake
    ninja
    gobject-introspection
  ];

  buildInputs = [
    glib
    libpulseaudio
  ];

  meta = with lib; {
    description = "Build libgnome-volume-control manually";
    homepage = "https://github.com/JingMatrix/gvc";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [daru-san];
    mainProgram = "gvc";
    platforms = platforms.all;
  };
}
