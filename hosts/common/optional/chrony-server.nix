{
  services.chrony = {
    enable = true;
    server = ["0.pool.ntp.org" "1.pool.ntp.org" "2.pool.ntp.org" "3.pool.ntp.org"];
    }; 
  networking.firewall.allowedUDPPorts = [ 53 ];
}