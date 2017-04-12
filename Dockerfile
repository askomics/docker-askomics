FROM ubuntu
MAINTAINER Olivier Filangi "olivier.filangi@inra.fr"

ENV ASKOMICS=https://github.com/askomics/askomics.git

# Prerequisites
RUN apt-get update && apt-get install -y \
  git \
  build-essential \
  python3 \
  python3-pip \
  python3-venv \
  vim \
  ruby \
  npm \
  nodejs-legacy

RUN git config --global http.sslVerify false
RUN git clone $ASKOMICS /usr/local/askomics/

WORKDIR /usr/local/askomics/

RUN npm install gulp -g
RUN npm install
RUN chmod +x startAskomics.sh

# Delete the local venv if exist and build the new one
RUN rm -rf /usr/local/askomics/venv && \
    ./startAskomics.sh -b

EXPOSE 6543
CMD ["./startAskomics.sh", "-r"]
