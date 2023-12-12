{
  services.bind = {
    enable = true;
    listenOn = [ "5353" ];
    ipv4Only = true;
    extraConfig = ''
     options {
       recursion no;
       allow-transfer { none; };
       dnssec-validation auto;
       auth-nxdomain no;
     };
    '';
    zones = {
      "example.com".extraConfig = "
        $TTL 2d    ; 172800 secs default TTL for zone
        $ORIGIN example.com.
        @             IN      SOA   ns1.example.com. hostmaster.example.com. (
                                2003080800 ; se = serial number
                                12h        ; ref = refresh
                                15m        ; ret = update retry
                                3w         ; ex = expiry
                                3h         ; min = minimum
                                )
                      IN      NS      ns1.example.com.
        joe           IN      A       192.168.254.3
        www           IN      CNAME   joe
      ";
     };  
    }; 
 };
}