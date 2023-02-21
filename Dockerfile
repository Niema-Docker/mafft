# Minimal Docker image for MAFFT v7.505 using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install MAFFT
RUN apk update && \
    apk add bash gcc make musl-dev && \
    wget -qO- "https://mafft.cbrc.jp/alignment/software/mafft-7.505-without-extensions-src.tgz" | tar -zx && \
    cd mafft-*/core && \
    make clean && \
    make && \
    make install && \
    cd ../.. && \
    rm -rf mafft-*
