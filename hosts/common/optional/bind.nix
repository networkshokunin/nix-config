{
  services.bind = {
    enable = true;
    listenOn = 5353;
    ipv4Only = true;
    forwarders = [ "1.1.1.1" ];
 };
}