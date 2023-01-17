{ pkgs }:

with pkgs;

let
  projectName = "execism";

  exercismPython = python3.withPackages (p: with p; [pytest pytest-cache pytest-subtests pytest-pylint]);
in

mkShell {
  name = "${projectName}-shell";
  
  packages = [
    glibcLocalesUtf8
    elixir
    exercism
    exercismPython
  ];

  LOCALE_ARCHIVE = if pkgs.stdenv.isLinux then "${pkgs.glibcLocalesUtf8}/lib/locale/locale-archive" else ""; 
}
