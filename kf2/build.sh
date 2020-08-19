#!/bin/bash

. ../common.sh

if [[ ! -f "/steam/kf2/KFGame/Config/PCServer-KFGame.ini" ]]; then
        "/steam/kf2/Binaries/Win64/KFGameSteamServer.bin.x86_64" kf-bioticslab?difficulty=0?adminpassword=secret?gamepassword=secret -port=7777 &
        sleep 20
        kfpid=$(pgrep -f port=7777)
        kill $kfpid
        #Workaround as per https://wiki.tripwireinteractive.com/index.php?title=Dedicated_Server_%28Killing_Floor_2%29#Setting_Up_Steam_Workshop_For_Servers
        mkdir -p "/steam/kf2/KFGame/Cache"
    fi

docker_build kf2
