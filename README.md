# docker-askomics

![Docker Build](https://img.shields.io/docker/pulls/askomics/docker-askomics.svg)
[![Build Status](https://travis-ci.org/askomics/docker-askomics.svg?branch=master)](https://travis-ci.org/askomics/docker-askomics)

AskOmics dockerized

## Pull from dockerHub

    docker pull askomics/docker-askomics

## Or build

    # Clone the repo
    git clone https://github.com/askomics/askomics.git
    cd askomics
    docker build -t askomics .

## Run

    docker run --name myAskOmics \
        -p 6543:6543 \
        d askomics/docker-askomics
