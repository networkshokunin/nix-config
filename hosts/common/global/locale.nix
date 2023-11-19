{ pkgs, lib, ... }: 
{
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    keyMap = "us";
    packages = with pkgs; [ jetbrains-mono ];
    font = "${pkgs.jetbrains-mono}/share/consolefonts/JetBrainsMono-Regular.ttf";   
  };
  
  time.timeZone = "Asia/Singapore";
}