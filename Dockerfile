# Minimal Docker image for MAFFT using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install MAFFT
RUN apk update && \
    apk add bash gcc make musl-dev && \
    wget -qO- "https://gitlab.com/sysimm/mafft/-/archive/v7.526/mafft-v7.526.tar.gz" | tar -zx && \
    cd mafft-*/core && \
    make clean && \
    make && \
    make install && \
    cd ../.. && \
    rm -rf mafft-*
