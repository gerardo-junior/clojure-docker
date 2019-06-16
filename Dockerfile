# Setting packages version
ARG LEIN_VERSION="2.8.3"
ARG OPENJDK_VERSION="8"

FROM library/clojure:openjdk-$OPENJDK_VERSION-lein-$LEIN_VERSION-alpine 

LABEL maintainer="Gerardo Junior <me@gerardo-junior.com>"
LABEL url="https://github.com/gerardo-junior/clojure-docker.git"

ENV USER "clojure"
ENV WORKDIR "/src"

# Configuring a default port for repl server
ENV LEIN_REPL_PORT 1234

# Creating project directory
RUN mkdir -p $WORKDIR

# Creating user and empowering sudo
RUN set -xe && \
    addgroup -g 1000 $USER && \
    adduser -u 1000 -G $USER -s /bin/sh -D $USER && \
    apk --update add --virtual .persistent-deps sudo && \
    echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default && \
    chown -Rf $USER $WORKDIR

COPY ./tools /opt/tools
RUN chmod -R +x /opt/tools/

# Setting project directory
VOLUME [$WORKDIR]
WORKDIR $WORKDIR
USER $USER
EXPOSE $LEIN_REPL_PORT
ENTRYPOINT ["/bin/sh", "/opt/tools/entrypoint.sh"]