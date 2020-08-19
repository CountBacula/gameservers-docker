FROM steamcmd

# Dear srcds, plz don't crash. We have brought you these offerings.
USER root
RUN dpkg --add-architecture i386; apt-get update;  apt-get install -y libstdc++6:i386 libcurl4-gnutls-dev:i386

USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/kf2

RUN ./steamcmd.sh +login anonymous +force_install_dir ../kf2 +app_update 232130  +quit

WORKDIR /steam/kf2/

ADD start*.sh .

CMD ["./start-kf2.sh"]
