# psdk-doc-docker

A simple docker container to build
[processor-sdk-doc](https://bitbucket.itg.ti.com/projects/PROCESSOR-SDK/repos/processor-sdk-doc).


## Why

Preempting incompatibility as that entire repos is based on deprecated sphinx
calls and weird hacks.


## Building

You need podman or docker for building. If either one of those is already
installed then just run `make`.


## Usage

New tooling has unified the invocation of Podman and Docker by fetching the
owner of the build directory and remapping an internal user to satisfy build
requirements. It will fail if the directory owner is in a reserved uid/gid
region.

After starting the container with your preferred container tool, follow the
instructions for building the documentation as usual.

```bash
docker run -it --rm -v "$PWD":/build ghcr.io/staticrocket/psdk-doc-docker
```
