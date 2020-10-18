l2tp-ipsec-vpn-client

1. VPN Server Address
2. Pre Shared Key
3. Username
4. Password

## Kencove

* added the internal network 192.168/16 with a test to the csi-db for api calls

## Run
Setup environment variables for your credentials and config:

    export VPN_SERVER_IPV4='1.2.3.4'
    export VPN_PSK='my pre shared key'
    export VPN_USERNAME='myuser@myhost.com'
    export VPN_PASSWORD='mypass'
    export VPN_CHECK_IP='1.2.3.4' # internal server addr

Now run it (you can daemonize of course after debugging):

    docker run --rm -it --privileged --net=host \
               -v /lib/modules:/lib/modules:ro \
               -e VPN_SERVER_IPV4 \
               -e VPN_PSK \
               -e VPN_USERNAME \
               -e VPN_PASSWORD \
                  kencove/l2tp-ipsec-vpn-client

## TODO
- [x] `ipsec` connection works
- [x] `xl2tpd` ppp0 device creates
- [x] Can forward traffic through tunnel from host
- [x] Pass in credentials as environment variables
- [x] Dynamically template out the default config files with `sed` on start
- [x] Update to use `libreswan` instead of `strongswan`
- [ ] See if this can work without privileged and net=host modes to be more portable

## References
* [royhills/ike-scan](https://github.com/royhills/ike-scan)
* [libreswan reference config](https://libreswan.org/wiki/VPN_server_for_remote_clients_using_IKEv1_with_L2TP)
* [Useful Config Example](https://lists.libreswan.org/pipermail/swan/2016/001921.html)
* [libreswan and Cisco ASA 5500](https://sgros.blogspot.com/2013/08/getting-libreswan-connect-to-cisco-asa.html)
* [NetDev0x12 IPSEC and IKE Tutorial](https://youtu.be/7oldcYljp4U?t=1586)
