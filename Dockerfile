FROM debian:buster
MAINTAINER rgruesbeck

RUN apt-get update && apt-get install -y \
	dirmngr \
	gnupg \
	ca-certificates \
	--no-install-recommends \
	&& gpg --keyserver pool.sks-keyservers.net --recv-keys F8E3347256922A8AE767605B7808CE96D38B9201 \
	&& gpg --export '7808CE96D38B9201' | apt-key add -\
	&& echo "deb http://www.lesbonscomptes.com/recoll/debian/ buster main" > /etc/apt/sources.list.d/recoll.list \
	&& echo "deb-src http://www.lesbonscomptes.com/recoll/debian/ buster main" >> /etc/apt/sources.list.d/recoll.list \
	&& apt-get update && apt-get install -y \
	recoll \
	python-recoll \
	python3-recoll \
	python-pip \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& pip install --upgrade setuptools \
	&& pip install wheel \
	&& pip install epub


ENV LANG en-US




