{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  
  #Commandline tools
  coreutils
  mkpasswd
  neovim
  git
  dig  

  #Shells
  starship

  #ZSH Tools
  zsh
  zsh-autosuggestions
  nix-zsh-completions

  ];
}