#!/bin/sh
sudo chgrp -Rf ${USER} ${WORKDIR}

exec "$@"