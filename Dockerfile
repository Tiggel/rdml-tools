FROM debian:buster-slim

ADD server /opt/rdml

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
	python3 \
	python3-pip \
	python3-lxml \
&& rm -rf /var/lib/apt/lists/* 

RUN pip3 install flask flask_cors numpy

CMD [ "python3", "./opt/rdml/server.py" ]
