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


