# Minimal Docker image for MAFFT v7.475 using Alpine base
FROM alpine:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install MAFFT
RUN apk update && \
    apk add bash gcc make musl-dev && \
    wget "https://mafft.cbrc.jp/alignment/software/mafft-7.475-with-extensions-src.tgz" | tar -zx && \
    cd mafft-7.475-with-extensions/core && \
    make clean && \
    make && \
    make install && \
    cd ../.. && \
    rm -rf mafft-7.475-with-extensions