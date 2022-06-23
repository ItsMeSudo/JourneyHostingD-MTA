#JourneyHosting Dockerfile Multi Theft Auto szerver

FROM ubuntu:20.04
VOLUME ["/data"]
WORKDIR /data
ENV TZ=Europe/Budapest
ARG DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN ln -s /usr/lib/libtinfo.so.6 /usr/lib/libtinfo.so.5

RUN apt update -y && \
    apt install git wget -y && \
    cd /root && \
    git clone https://github.com/ItsMeSudo/JourneyHostingD-MTA.git && \
    cd JourneyHostingD-MTA && chmod +x * && \
    ./setup.sh

CMD cd /root/JourneyHostingD-MTA && \
    ./startup.sh