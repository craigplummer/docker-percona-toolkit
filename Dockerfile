FROM ubuntu:xenial
MAINTAINER Craig Plummer, craig@craigplummer.uk

RUN apt-get update && apt-get install -y \
            libdbd-mysql-perl \
            libdbi-perl \
            libio-socket-ssl-perl \
            libterm-readkey-perl \
            perl \
            wget

ENV PERCONA_MAJOR_VERSION 2.2.20
ENV PERCONA_MINOR_VERSION 2.2.20-1

WORKDIR /tmp
RUN wget https://www.percona.com/downloads/percona-toolkit/${PERCONA_MAJOR_VERSION}/deb/percona-toolkit_${PERCONA_MINOR_VERSION}_all.deb && \
    dpkg -i percona-toolkit_${PERCONA_MINOR_VERSION}_all.deb && \
    rm -f percona-toolkit_${PERCONA_MINOR_VERSION}_all.deb