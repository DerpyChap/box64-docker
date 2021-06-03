# box86-docker
Simple Dockerfile to run 32-bit x86 binaries on ARMv7 and ARMv8 CPUs within Docker using Box86.

## Usage
Create a new image using `box86-docker` as a baseline. For your `CMD` be sure to call `box86` and pass your binary to it.

## Example
A quick and dirty TeamSpeak server using `box86-docker` as a PoC of sorts (please don't actually use this):

```dockerfile
FROM box86-docker:latest

RUN apt update && apt install wget

RUN wget -O server.tar.bz2 https://files.teamspeak-services.com/releases/server/3.13.5/teamspeak3-server_linux_x86-3.13>

EXPOSE 9987/udp 10011 30033

WORKDIR "/teamspeak3-server_linux_x86"

CMD ["box86", "ts3server"]
```

## To-Do
idk many things
