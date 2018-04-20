[![Docker Build](https://img.shields.io/docker/pulls/askomics/askomics.svg)](https://hub.docker.com/r/askomics/askomics/)
AskOmics dockerized


## Pull from dockerHub

    docker pull askomics/askomics

## Or build

    # Clone the repo
    git clone https://github.com/askomics/docker-askomics.git
    cd askomics
    docker build -t askomics .

## Run

    docker run --name askomics -p 6543:6543 d askomics/askomics


## .ini configuration

All askomics properties defined in section [app:main] of the .ini file can be configured via the environment variables. The environment variable should be prefixed with ASKO_, without the askomics.

For exemple, if ou want to modify `askomics.overview_lines_limit = 200` of the ini file, you must declare a environment variable like `ASKO_overview_lines_limit="1000"`
