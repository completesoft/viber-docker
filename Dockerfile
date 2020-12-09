FROM ubuntu:18.04 
RUN apt-get update && apt-get install -y \
    wget \
    gdebi-core \
    libxss1 \
    libfontconfig libqt5gui5 libxrandr2 libharfbuzz-bin \
    mesa-utils libxrender1 libxcomposite1 libxslt1.1
RUN cd /tmp && wget --progress=dot:giga  https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb 
RUN gdebi -n /tmp/viber.deb
RUN apt-get install -y sudo
RUN apt-get install -y libsm6
RUN useradd -s /bin/bash -m gui
ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb
CMD sudo -u gui -i  -- /opt/viber/Viber
