FROM alpine
MAINTAINER Olivier Filangi "olivier.filangi@inra.fr"

# Prerequisites
RUN apk add --update bash make gcc g++ zlib-dev libzip-dev bzip2-dev xz-dev git python3 python3-dev nodejs nodejs-npm

ENV ASKOMICS=https://github.com/askomics/askomics.git
# ENV ASKOMICS_COMMIT=ff0a21d465f172715cbcbd71d3e87f2016bb4a01

RUN git clone $ASKOMICS /usr/local/askomics/
WORKDIR /usr/local/askomics/
# RUN git checkout $ASKOMICS_COMMIT

RUN npm install gulp -g
RUN npm install

RUN chmod +x startAskomics.sh
RUN rm -rf /usr/local/askomics/venv
RUN bash ./startAskomics.sh -b

EXPOSE 6543
CMD ["bash", "./startAskomics.sh", "-r"]
