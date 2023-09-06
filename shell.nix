{ pkgs }:

with pkgs;

let
  projectName = "exercism";

  exercismPython = python3.withPackages (p: with p; [pytest pytest-cache pytest-subtests pytest-pylint]);

  fSharp = [ dotnet-sdk_7 dotnet-runtime_7];
in

mkShell {
  name = "${projectName}-shell";
  
  packages = [
    glibcLocalesUtf8
    elixir
    exercism
    exercismPython
    fSharp
    ballerina
    kotlin
    gradle
  ];

  LOCALE_ARCHIVE = if pkgs.stdenv.isLinux then "${pkgs.glibcLocalesUtf8}/lib/locale/locale-archive" else ""; 

  shellHook = ''
    export GRADLE_HOME=${gradle}/lib/gradle
  '';
}
