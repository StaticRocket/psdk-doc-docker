FROM ubuntu:22.04

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		--no-install-recommends \
		dumb-init \
		git \
		gosu \
		make \
		python3-sphinx \
		python3-sphinx-rtd-theme \
		ripgrep \
		rstcheck \
		zip \
	&& echo "**** create abc user and make our folders ****" \
	&& useradd -u 1000 -U -d /config -s /bin/false abc \
	&& usermod -G users abc \
	&& mkdir /build && chown abc:abc /build \
	&& mkdir /config && chown abc:abc /config \
	&& echo "**** cleanup ****" \
	&& apt-get autoremove \
	&& apt-get clean \
	&& rm -rf \
		/tmp/* \
		/var/cache/debconf/*-old \
		/var/lib/apt/lists/* \
		/var/lib/dpkg/status-old \
		/var/lib/sgml-base/supercatalog.old \
		/var/log/apt/term.log \
		/var/tmp/*

COPY root/ /

WORKDIR /build
VOLUME /build

ENTRYPOINT ["/init"]
CMD /bin/bash
