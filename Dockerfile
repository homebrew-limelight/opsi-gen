FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture armhf
RUN apt-get -y update && \
    apt-get -y install \
        git vim parted \
        quilt coreutils debootstrap qemu-user-static zerofree zip dosfstools \
        bsdtar libcap2-bin rsync grep udev xz-utils curl xxd file kmod\
        python3-dev python3.7-dev python3-numpy libpython3.7-dev:armhf\
        libtiff-dev:armhf zlib1g-dev:armhf libjpeg-dev:armhf libpng-dev:armhf libavcodec-dev:armhf libavformat-dev:armhf libswscale-dev:armhf libv4l-dev:armhf libxvidcore-dev:armhf libx264-dev:armhf \
        crossbuild-essential-armhf gfortran-arm-linux-gnueabihf cmake pkg-config \
    && rm -rf /var/lib/apt/lists/*
RUN curl -O http://ftp.us.debian.org/debian/pool/main/c/checkinstall/checkinstall_1.6.2-4_amd64.deb; dpkg -i checkinstall_1.6.2-4_amd64.deb

COPY . /pi-gen/

VOLUME [ "/pi-gen/work", "/pi-gen/deploy", "/pi-gen/cache"]
