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


## .ini configuration

All askomics properties defined in section [app:main] of the .ini file can be configured via the environment variables. The environment variable should be prefixed with ASKO_, without the askomics.

For exemple, if ou want to modify `askomics.overview_lines_limit = 200` of the ini file, you must declare a environment variable like `ASKO_overview_lines_limit="1000"`
