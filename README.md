# Supported languages, with all Exercism requirements

- Elixir
- Python
- F# (I think every DotNET language too)
- Ballerina
- Kotlin

# Dependencies

1 - Install Nix. Works on Linux, macOS and WSL. www.nixos.org

2 - Enable nix-flake. Handy commands to do so.

```sh  
mkdir -p ~/.config/nix
```

```sh
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf 
```

Restart your computer or only the nix-deamon
  
3 - Install direnv using Nix.
  ```sh
  nix profile install nixpkgs#direnv
  ```
  
4 - Add direnv hook. If you don't know your current shell, type
```sh
echo $SHELL
```

add accordingly to your shell

```sh
\# ~/.bashrc
eval "$(direnv hook bash)"

\# ~/.zshrc
eval "$(direnv hook zsh)"

\# ~/.config/config.fish
direnv hook fish | source
```
Close then open your terminal.

# Setup your token

Get your token at https://exercism.org/settings/api_cli

```sh
echo "EXERCISM_TOKEN=your_token" >> .env
```

Send ``direnv allow`` in your terminal while inside project folder.

Done, all dependencies will be fetched, built and then cached, as well as your Exercism.

# Want more supported languages?
Just open an Issue or PR :)

# TODO
- Provide a template derivation
- Improve READme. I know it's quite lame atm
- Lazy evaluation of the languages?
- An editor with extensions installed?

