# Docker container for Brave


This project implements a Docker container for [Brave](https://brave.com/).

The GUI of the application is accessed through a modern web browser (no
installation or configuration needed on the client side (noVNC) ) or via any VNC client.

**based on [https://github.com/jlesage/docker-firefox/](https://github.com/jlesage/docker-firefox/)**



---

[![Brave logo](https://images.weserv.nl/?url=raw.githubusercontent.com/devloic/podman-brave/refs/heads/main/brave_logo.png&w=330)](https://www.brave.com/)

Brave is a free and open-source web browser developed by Brave
under Mozilla Public License Version 2.0.



## Quick Start

> [!IMPORTANT]
> The Docker command provided in this quick start is given as an example and
> parameters should be adjusted to your need.

Launch the Firefox docker container with the following command:

```shell
docker run --privileged -p 5800:5800 -p 5900:5900 -v ./sharedwithhost:/config/sharedwithhost -e WEB_AUDIO=1 docker.io/devloic/docker-brave
```


Where:

  - `./sharedwithhost`: This is where you can save files with brave and share it with the host.

Browse to `http://your-host-ip:5800` to access the Brave GUI.
VNC: your-host-ip:5900

The image is based on alpine. For now Brave is available as a flatpak on alpine. Flatpak needs privileged access to run inside a container.
If this a problem for you, use podman. In privileged mode with podman, the container cannot have more privileges than the account that launched it.
https://docs.podman.io/en/latest/markdown/podman-exec.1.html#privileged

```shell
podman run --privileged -p 5800:5800 -p 5900:5900 -v ./sharedwithhost:/config/sharedwithhost -e WEB_AUDIO=1 docker.io/devloic/docker-brave
```

For docker compose / podman-compose:

docker  compose up -d
podman-compose up -d


Build image with docker:
```shell
docker buildx build --network host --progress plain --allow network.host --load . -t docker.io/devloic/docker-brave:latest 

or

docker  build --network host . -t docker.io/devloic/docker-brave
```

--network host => necessary because flatpak might have dns problems getting its resources during build time 

Build image with podman:
```shell
podman  build --network host . -t docker.io/devloic/docker-brave
```

For more options check https://github.com/jlesage/docker-baseimage-gui



![Screenshot_dockerbrave](https://github.com/user-attachments/assets/1f875e7c-df12-453d-aec5-b54eb014002b)
