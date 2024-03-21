FROM ubuntu:22.04

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		--no-install-recommends \
		dumb-init \
		gosu \
		make \
		python3-sphinx \
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
		/var/lib/apt/lists/* \
		/var/tmp/* \
		/var/log/*

COPY root/ /
RUN chown root:root /init \
	&& chmod +x /init

WORKDIR /build
VOLUME /build

ENTRYPOINT ["/init"]
CMD /bin/bash
