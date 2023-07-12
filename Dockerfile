FROM artifactory.itg.ti.com/docker-public/library/ubuntu:22.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	--no-install-recommends \
	dumb-init \
	python3-sphinx \
	make

RUN echo "**** cleanup ****" && \
	apt-get clean -y; \
	rm -rf \
		/tmp/* \
		/var/lib/apt/lists/* \
		/var/tmp/*

ENTRYPOINT ["dumb-init", "--", "bash"]
