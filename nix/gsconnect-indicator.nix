{
  writePyton3Bin,
  python3Packages,
  ...
}:
writePyton3Bin "gsconnect-indicator" {
  libraries = with python3Packages; [
    pydbus
    json
  ];
}
builtins.readFile
../scripts/gsconnect.py
