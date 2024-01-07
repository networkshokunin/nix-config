{
  services.chrony = {
    enable = true;
    servers = ["ntpmon.dcs1.biz" "time.cloudflare.com"];
    serverOption = "iburst";
    enableNTS = true;
    }; 
  networking.firewall.allowedUDPPorts = [ 123 ];
}