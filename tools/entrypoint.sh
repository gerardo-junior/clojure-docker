#!/bin/sh
sudo chgrp -Rf ${USER} ${WORKDIR}

if [ -f "$(pwd)/.env" ]; then
    export eval $(egrep -v '^#' .env | xargs)
fi

if [ ! -d "$(pwd)/target" ]; then
    if [ -e "$(pwd)/project.clj" ]; then
        /usr/local/bin/lein deps
    fi
fi

if [ ! -z "$1" ]; then
    if [[ -z "$(which -- $1)" ]]; then
        /usr/local/bin/lein "$@"
    else
        exec "$@"
    fi
fi