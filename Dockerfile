FROM resin/rpi-raspbian:jessie

COPY ./entry.sh /

RUN apt-get update && \
  apt-get install libusb-1.0-0-dev git libusb-1.0-0 libcurl4-openssl-dev libncurses5-dev libudev-dev && \
  wget http://ck.kolivas.org/apps/cgminer/cgminer-4.10.0.tar.bz2 && \
  tar xvf cgminer-4.10.0.tar.bz2 && \
  cd cgminer-4.10.0 && \
  ./configure –enable-icarus && \
  make install && \
  apt-get install screen
RUN git clone https://github.com/IdleHandsProject/BTCLotto.git

ENTRYPOINT ["/entry.sh"]
