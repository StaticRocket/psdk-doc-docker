# psdk-doc-docker

A simple docker container to build
[processor-sdk-doc](https://bitbucket.itg.ti.com/projects/PROCESSOR-SDK/repos/processor-sdk-doc).


## Why

Preempting incompatibility as that entire repos is based on deprecated sphinx
calls and weird hacks.


## Usage

You need podman or docker for building. If either one of those is already
installed then just run `make`. The container invocation works differently
between those tools though.


### Podman

```bash
podman run -it --rm -v /arc:/arc --user "$(id -u)":"$(id -g)" --userns=keep-id ti/psdk-doc-docker
```
