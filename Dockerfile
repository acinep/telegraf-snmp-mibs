FROM telegraf:1.9.1

MAINTAINER Noel Phillips <noel@univeo.net>

RUN rm /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian stretch main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y unzip snmp-mibs-downloader 

RUN wget https://global.download.synology.com/download/Document/Software/DeveloperGuide/Firmware/DSM/All/enu/Synology_MIB_File.zip -O Synology_MIB_File.zip && \
unzip Synology_MIB_File.zip

RUN mv Synology_MIB_File/* /usr/share/snmp/mibs/

RUN download-mibs