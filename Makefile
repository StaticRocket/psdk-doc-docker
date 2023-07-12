ifeq ($(CONTAINER_TOOL),)
  $(info CONTAINER_TOOL unset, checking if docker is present...)
  ifneq ($(shell which docker 2> /dev/null),)
    $(info Using docker for build...)
    CONTAINER_TOOL := docker
  else ifneq ($(shell which podman 2> /dev/null),)
    $(info Using podman for build...)
    CONTAINER_TOOL := podman
  endif
endif

.PHONY: all
all: Dockerfile
	$(CONTAINER_TOOL) build . -t ti/psdk-doc-docker
