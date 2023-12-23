{
  boot.supportedFilesystems = ["zfs"]; 
  services.zfs.autoSnapshot.enable = true;
  services.zfs.autoScrub.enable = true;
  services.zfs.trim.enable = true;
}