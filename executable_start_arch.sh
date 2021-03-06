#!/bin/bash
EXISTING=$(docker container ls | grep arch-linux:stable | awk '{ print $1}')
if [[ $EXISTING ]]; then
    docker attach "$EXISTING"
else
    EXISTING=$(docker run --rm -d -it \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v ~/:/home/"$USER" \
        -e HOME="/home/$USER" \
        --network host \
        --name arch-linux-tmux-stable \
        agentzhao/arch-linux:latest \
        tmux)
    docker attach "$EXISTING"
fi

