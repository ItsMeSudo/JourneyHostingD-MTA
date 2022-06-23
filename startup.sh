#!/bin/bash
normal_startup() {
    echo "A mappa nem üres, szerver indítás folyamatban."
        cd /data && \
        ./mta-server64 -x -n -u
}

installnstartup() {
    echo "A mappa üres, szerver telepítás folyamatban."
        cd /root/JourneyHostingD-MTA && \
        tar -xf multitheftauto_linux_x64.tar.gz && \
        tar -xf baseconfig.tar.gz && \
        mkdir temp && \
        cp -R /root/JourneyHostingD-MTA/multitheftauto_linux_x64/* /root/JourneyHostingD-MTA/temp && \
        cp -R /root/JourneyHostingD-MTA/baseconfig/* /root/JourneyHostingD-MTA/temp/mods/deathmatch/resources && \
        mkdir /root/JourneyHostingD-MTA/temp/mods/deathmatch/resources && \
        cd /root/JourneyHostingD-MTA/temp/mods/deathmatch/resources && \
        cp /root/JourneyHostingD-MTA/mtasa-resources-latest.zip /root/JourneyHostingD-MTA/temp/mods/deathmatch/resources/ && \
        unzip mtasa-resources-latest.zip && \
        rm -rf mtasa-resources-latest.zip && \
        cd /root/JourneyHostingD-MTA && \
        rm -rf multitheftauto_linux_x64 baseconfig && \
        mv /root/JourneyHostingD-MTA/temp/* /data && \
        rm -rf temp && \
        cd /data && \
        chmod +x mta-server64

    echo "A szerver telepítése kész van, szerver indítás folyamatban."
        cd /data && \
        ./mta-server64 -x -n -u
}

if find /data -mindepth 1 -maxdepth 1 | read; then
   normal_startup
else
   installnstartup
fi