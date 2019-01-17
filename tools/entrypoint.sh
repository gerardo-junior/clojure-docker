#!/bin/sh
sudo chgrp -Rf ${USER} ${WORKDIR}

if [ -e "$(pwd)/project.clj" ]; then
    /usr/local/bin/lein deps    
fi

if [[ -z "$(which -- $1)" ]]; then
    /usr/local/bin/lein "$@"
else
    exec "$@"
fi