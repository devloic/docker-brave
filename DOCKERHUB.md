# Docker container for Brave

This is a Docker container for [Brave](https://www.brave.com/).

The GUI of the application is accessed through a modern web browser (no
installation or configuration needed on the client side (noVNC) ) or via any VNC client.

---

[![Brave logo](https://images.weserv.nl/?url=raw.githubusercontent.com/devloic/docker-brave/refs/heads/main/brave_logo.png&w=110)](https://www.brave.com)

Brave is a free and open-source web browser developed by Brave under  [MPL-2.0 license](https://github.com/brave/brave-browser#MPL-2.0-1-ov-file)

---

## Quick Start

Launch the brave docker container with the following command:
```shell
docker run --privileged -p 5800:5800 -p 5900:5900 -v ./sharedwithhost:/config/sharedwithhost -e WEB_AUDIO=1 docker.io/devloic/docker-brave

Where:

  - `./sharedwithhost`: This is where you can save files with brave and share it with the host.

Browse to `http://your-host-ip:5800` to access the Brave GUI.
VNL your-host-ip:5900

The image is based on alpine. For now Brave is available as a flatpak on alpine. Flatpak needs privileged access to run inside a container.
If this a problem for you, use podman. In privileged mode with podman, the container cannot have more privileges than the account that launched it.
https://docs.podman.io/en/latest/markdown/podman-exec.1.html#privileged


```
```shell
podman run --privileged -p 5800:5800 -p 5900:5900 -v ./sharedwithhost:/config/sharedwithhost -e WEB_AUDIO=1 docker.io/devloic/docker-brave
```

For docker compose / podman-compose check documentation on https://github.com/devloic/docker-brave

