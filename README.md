# box86-docker
Simple Dockerfile to run 64-bit x86 binaries on ARMv8 CPUs within Docker using Box64.

## Usage
Create a new image using `box64-docker` as a baseline. For your `CMD` be sure to call `box64` and pass your binary to it.

## Example
A quick and dirty TeamSpeak server using `box63-docker` as a PoC of sorts (please don't actually use this):

```dockerfile
FROM box64-docker:latest

RUN apt update && apt install wget

RUN wget -O server.tar.bz2 https://files.teamspeak-services.com/releases/server/3.13.6/teamspeak3-server_linux_amd64-3.13.6.tar.bz2 && \
    tar -xf server.tar.bz2

EXPOSE 9987/udp 10011 30033

WORKDIR "teamspeak3-server_linux_amd64"

ENV TS3SERVER_LICENSE=accept

CMD ["box64", "ts3server"]
```

## To-Do
idk many things
