FROM alpine
MAINTAINER Xavier Garnier "xavier.garnier@irisa.fr"

# Environment variables
ENV ASKOMICS="https://github.com/askomics/askomics.git" \
    ASKOMICS_DIR="/usr/local/askomics" \
    ASKOMICS_VERSION="master"

# Install prerequisites, clone repository and install
RUN apk add --update bash make gcc g++ zlib-dev libzip-dev bzip2-dev xz-dev git python3 python3-dev nodejs nodejs-npm linux-headers openldap-dev && \
    git clone -b ${ASKOMICS_VERSION} --single-branch --depth=1 ${ASKOMICS} ${ASKOMICS_DIR} && \
    cd ${ASKOMICS_DIR} && \
    npm install --production && \
    bash ./startAskomics.sh -b && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache/* && \
    rm -rf /root/.npm/* && \
    rm -rf /tmp/*

WORKDIR /usr/local/askomics/

EXPOSE 6543
CMD ["bash", "./startAskomics.sh", "-r"]
