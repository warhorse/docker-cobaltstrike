.PHONY: build all
.DEFAULT_GOAL := all

IMAGE?=warhorse/cobaltstrike

all: build

build:
docker build \
    --build-arg BUILD_RFC3339=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
    --build-arg COMMIT=$(git rev-parse --short HEAD) \
    --build-arg VERSION=$(git describe --tags --always) \
    -t $(IMAGE) .
