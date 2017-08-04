FROM alpine
MAINTAINER Olivier Filangi "olivier.filangi@inra.fr"

# Environment variables
ENV ASKOMICS="https://github.com/askomics/askomics.git" \
    ASKOMICS_DIR="/usr/local/askomics"
#ENV ASKOMICS_COMMIT ff0a21d465f172715cbcbd71d3e87f2016bb4a01

# Install prerequisites, clone repository and install
RUN apk add --update bash make gcc g++ zlib-dev libzip-dev bzip2-dev xz-dev git python3 python3-dev nodejs nodejs-npm && \
    git clone ${ASKOMICS} ${ASKOMICS_DIR} && \
    cd ${ASKOMICS_DIR} && \
    #git checkout ${ASKOMICS_COMMIT} && \
    npm install gulp -g && \
    npm install && \
    chmod +x startAskomics.sh && \
    rm -rf /usr/local/askomics/venv && \
    bash ./startAskomics.sh -b

WORKDIR /usr/local/askomics/

EXPOSE 6543
CMD ["bash", "./startAskomics.sh", "-r"]
