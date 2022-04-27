FROM debian:bullseye

ENV BAIDUNETDISK_VERSION 4.3.0

RUN apt update && apt upgrade -y && \
	apt install -y procps libgtk-3-0 libnotify4 libnss3 libxss1 xdg-utils libatspi2.0-0 libsecret-1-0 libgbm1 libasound2 libcanberra-gtk-module fonts-arphic-ukai fonts-arphic-uming desktop-file-utils && \
	apt install -y wget && \
	cd /tmp && \
	wget -q https://issuepcdn.baidupcs.com/issue/netdisk/LinuxGuanjia/${BAIDUNETDISK_VERSION}/baidunetdisk_${BAIDUNETDISK_VERSION}_amd64.deb && \
	dpkg -i baidunetdisk_${BAIDUNETDISK_VERSION}_amd64.deb || apt install -f -y && \
	rm baidunetdisk_${BAIDUNETDISK_VERSION}_amd64.deb && \
	apt remove -y wget --purge && apt autoremove -y --purge && \
	apt clean && rm -rf /var/lib/apt/lists/* && \
	cd -

CMD ["/opt/baidunetdisk/baidunetdisk", "--no-sandbox"]
