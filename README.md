# [warhorse/cobaltstrike](https://github.com/warhorse/docker-cobaltstrike)
[![GitHub Release](https://img.shields.io/github/release/war-horse/docker-cobaltstrike.svg?style=flat-square&color=E68523)](https://github.com/war-horse/docker-cobaltstrike/releases)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/warhorse/cobaltstrike.svg?style=flat-square&color=E68523)](https://microbadger.com/images/warhorse/cobaltstrike "Get your own version badge on microbadger.com")
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/warhorse/cobaltstrike.svg?style=flat-square&color=E68523)](https://microbadger.com/images/warhorse/cobaltstrike "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/warhorse/cobaltstrike.svg?style=flat-square&color=E68523)](https://hub.docker.com/r/warhorse/cobaltstrike)
[![Docker Stars](https://img.shields.io/docker/stars/warhorse/cobaltstrike.svg?style=flat-square&color=E68523)](https://hub.docker.com/r/warhorse/cobaltstrike)

[Cobaltstrike](https://www.cobaltstrike.com/) - Software for Adversary Simulations and Red Team Operations.


![Cobaltstrike](https://www.cobaltstrike.com/images/logo.png)

## WARNING

You need a valid Cobaltstrike key to use this image. The Cobaltstrike software is downloaded when this image is started. If you need a license please go to [Cobaltstrike](https://www.cobaltstrike.com/)

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=coblatstrike \
  -e TZ=Europe/London \
  -e COBALTSTRIKE_KEY=cs_key \
  -e COBALTSTRIKE_PASS=cs_password \
  -e COBALTSTRIKE_EXP=2020-12-20 \
  -e COBALTSTRIKE_PROFILE=malleable.profile \
  -p 50050:50050 \
  -p 443:443 \
  -p 80:80 \
  -v <path to data>:/opt/cobaltstrike \
  --restart unless-stopped \
  warhorse/cobaltstrike
```

### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  covenant:
    image: warhorse/cobaltstrike
    container_name: cobaltstrike
    environment:
      - TZ=Europe/London
      - COBALTSTRIKE_KEY=cs_key
      - COBALTSTRIKE_PASS=cs_password
      - COBALTSTRIKE_EXP=2020-12-20
      - COBALTSTRIKE_PROFILE=malleable.profile
    volumes:
      - <path to data>:/opt/cobaltstrike
    ports:
      - 50050:50050
      - 443:443
      - 80:80
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 50050` | The port for the Cobaltstrike admin interface |
| `-p 80` | The port for HTTP C2 traffic |
| `-p 443` | The port for HTTPS C2 traffic |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London|
| `-e COBALTSTRIKE_KEY=cs_key` | Specify a valid Cobaltstrike key|
| `-e COBALTSTRIKE_PASS=cs_password` | Specify a Cobaltstrike password|
| `-e COBALTSTRIKE_EXP=2020-12-20` | Specify a malleable C2 kill date|
| `-e COBALTSTRIKE_PROFILE=malleable.profile` | Specify a malleable C2 profile name|
| `-v /opt/cobaltstrike` | Cobaltstrike data folder |

&nbsp;
## Application Setup

Access the teamserver at `<your-ip>:50050`, You will need the Cobaltstrike client to access this interface. For more information check out [Cobaltstrike](https://www.cobaltstrike.com/).



## Support Info

* Shell access whilst the container is running: `docker exec -it cobaltstrike /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f cobaltstrike`

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:
```
git clone https://github.com/warhorse/docker-cobaltstrike.git
cd docker-cobaltstrike
docker build \
  --no-cache \
  --pull \
  -t warhorse/cobaltstrike:latest .
```
## Versions

* **10.30.19:** - First Push
* **12.30.21:** - Update URL