# Pre-Built pyAudioAnalysis Docker image

Built for
* amd64
* arm64
* arm6
* arm7

## Building

Make sure you have experimental support enabled.

```
docker buildx create --name pibuilder --use
```

```
docker buildx inspect --bootstrap
```

```
export DOCKER_CLI_EXPERIMENTAL=enabled
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx build \
    --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
    -t ncrmro/py-ffmpeg-docker-images:latest \
    -t ncrmro/py-ffmpeg-docker-images:1.0.11 \
    --push .
```
