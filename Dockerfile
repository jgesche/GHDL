## GHDLSYNTH-BETA ##
FROM debian:buster AS ghdl-formal

# Get runtime dependencies
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    ca-certificates \
    libreadline7 \
    libtcl8.6 \
    wget \
    libgnat-8 \
    libllvm7 \
    git \
    libz-dev \
    gcc \
    gnat \
    tar \
    make \
    python3 && \
    apt-get upgrade && apt-get autoclean && apt-get clean && apt-get -y autoremove && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN cd /root && \
    git clone "https://github.com/ghdl/ghdl.git" ghdl && \
    cd ghdl && \
    mkdir build && \
    ./configure --prefix=/usr/local && \
    make && \
    make install
