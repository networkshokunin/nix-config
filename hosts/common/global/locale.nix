{ pkgs, lib, ... }:
{
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    keyMap = "us";
    packages = with pkgs; [ jetbrains-mono ];
    font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    #use fc-list to list the fonts installed and then set the font
  };

  time.timeZone = "Asia/Singapore";
}