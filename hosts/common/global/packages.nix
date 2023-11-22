{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  
  #Commandline tools
  coreutils
  mkpasswd
  neovim
  git
  dig
  exa
  wget
  fzf
  zsh-fzf-tab
  neofetch

  #Shells
  starship

  #ZSH Tools
  zsh
  zsh-autosuggestions
  nix-zsh-completions

  ];
}


