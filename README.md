#JourneyHosting Dockerfile Multi Theft Auto szerver

#SUDO                 2022              SERVERHU.EU

Példa:

  docker container create --name mta-test -v /home/asd/servers/mta:/data -p 22003:22003/udp -p 22005:22005/tcp zud0/journeyhostingd-mta:latest 
  
  docker container start mta-test 
  
  docker logs mta-test -f
  
  
  ## https://hub.docker.com/u/zud0
