{ pkgs }:

with pkgs;

let
  projectName = "execism";

  exercismPython = python3.withPackages (p: with p; [pytest pytest-cache pytest-subtests pytest-pylint]);

  fSharp = [exercism dotnet-sdk_7 dotnet-runtime_7];
in

mkShell {
  name = "${projectName}-shell";
  
  packages = [
    glibcLocalesUtf8
    elixir
    exercism
    exercismPython
    fSharp
  ];

  LOCALE_ARCHIVE = if pkgs.stdenv.isLinux then "${pkgs.glibcLocalesUtf8}/lib/locale/locale-archive" else ""; 
}
