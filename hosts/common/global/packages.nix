{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  
  #Commandline tools
  coreutils
  mkpasswd
  neovim
  git
  dig
  eza
  wget
    

  #Shells
  starship

  #ZSH Tools
  zsh
  zsh-autosuggestions
  nix-zsh-completions

  ];
}