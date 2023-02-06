## Dependencies

1- Install Nix. Works on Linux, macOS and WSL. www.nix.org
2- Enable nix-flake. Handy commands to do so.
  - ``sh
  mkdir -p ~/.config/nix
  echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf 
  ``
3- Install direnv using Nix.
  ``sh
  nix profile install nixpkgs#direnv
  ``
4- Add direnv hook. If you don't know your current shell, type
``sh
echo $SHELL
``
add accordingly to your shell

``sh
# ~/.bashrc
eval "$(direnv hook bash)"

# ~/.zshrc
eval "$(direnv hook zsh)"

# ~/.config/config.fish
direnv hook fish | source
``


## Setup your token

Get your token at https://exercism.org/settings/api_cli

``sh
echo "EXERCISM_TOKEN=your_token"
``

Send ``direnv allow`` in your terminal while inside project folder.

Done, all dependencies will be fetched, built and then cached, as well as your Exercism.
