# shadowsocks
#
# VERSION 0.0.3

FROM ubuntu:14.04.3
MAINTAINER Dariel Dato-on <oddrationale@gmail.com>

RUN apt-get update && \
    apt-get install -y python-pip
RUN pip install shadowsocks==2.8.2

# The SS command from environment variables
#
# Ref:
#   https://github.com/docker/docker/issues/5509
#   
CMD /usr/local/bin/ssserver -s ${SS_SERVER} -p ${SS_PORT} -k ${SS_PASSWORD} -m ${SS_ENCRYPTION}
