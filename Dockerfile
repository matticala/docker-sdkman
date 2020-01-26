ARG ubuntu_version=latest
FROM ubuntu:${ubuntu_version} AS base

RUN apt-get update \
 && apt-get install -y \
    curl \
    zip \
    unzip \
    bash

WORKDIR /bin
RUN rm -rf sh sh.distrib \
 && ln -s /bin/bash sh \
 && ln -s /bin/bash sh.distrib
WORKDIR /

ENTRYPOINT [ "bash" ]

FROM base

ENV SDKMAN_DIR="/usr/local/sdkman"

RUN curl -s "https://get.sdkman.io" | bash \
 && chmod a+x "${SDKMAN_DIR}/bin/sdkman-init.sh"

RUN ln -s $SDKMAN_INIT /etc/profile.d/02-sdkman-init.sh

SHELL [ "/bin/bash", "--login", "-c" ]
