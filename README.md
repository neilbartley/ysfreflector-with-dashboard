# YSFReflector with Dashboard Docker Image

This repository only contains Docker build considerations to produce an image from `master` of [`https://github.com/g4klx/YSFClients/YSFReflector`](https://github.com/g4klx/YSFClients) and [`https://github.com/dg9vh/YSFReflector-Dashboard`](https://github.com/dg9vh/YSFReflector-Dashboard). It will be available as `neilbartley/ysfreflector-with-dashboard` at:

* [Docker Hub (`neilbartley/ysfreflector-with-dashboard:latest`)](https://hub.docker.com/r/neilbartley/ysfreflector-with-dashboard)
* [GitHub (`ghcr.io/neilbartley/ysfreflector-with-dashboard:latest`)](https://github.com/neilbartley/ysfreflector/pkgs/container/ysfreflector-with-dashboard)

# Running

## Requirements

* [Docker](https://docs.docker.com/install/)
* Firewall setup to accept `42000/udp` and `80/tcp`

## Usage

`docker run -e REFLECTOR_NAME="YOUR_NAME_HERE" -e REFLECTOR_DESCRIPTION="YOUR_DESCRIPTION_HERE" -p 42000:42000/udp -p 80:80/tcp --name=ysfreflector-with-dashboard ghcr.io/neilbartley/ysfreflector-with-dashboard:latest`

# Contact

73, G7UFO
g7ufo@neil.bar
