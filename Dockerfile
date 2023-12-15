FROM ubuntu:22.04

RUN \
	apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
		--no-install-recommends \
		dumb-init \
		make \
		python3-sphinx \
		rstcheck \
		zip && \
	echo "**** cleanup ****" && \
	apt-get autoremove && \
	apt-get clean && \
	rm -rf \
		/tmp/* \
		/var/lib/apt/lists/* \
		/var/tmp/* \
		/var/log/*

ENTRYPOINT ["dumb-init", "--"]
CMD /bin/bash
