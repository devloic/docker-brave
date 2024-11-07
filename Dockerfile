#
# brave Dockerfile
#
# https://github.com/devloic/docker-brave
#

# Pull base image.
FROM  docker.io/jlesage/baseimage-gui:alpine-3.20-v4

# Docker image version is provided via build arg.
ARG DOCKER_IMAGE_VERSION=

# Define working directory.
WORKDIR /tmp

COPY rootfs/ /

RUN --network=host \
    add-pkg --no-cache flatpak dbus-x11 xdg-dbus-proxy && \
    flatpak remote-add  --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak install -y flathub com.brave.Browser && \
    set-cont-env APP_NAME "Brave" && \
    set-cont-env APP_VERSION "$(flatpak list | grep brave | awk '{print $3}')" && \
    set-cont-env DOCKER_IMAGE_VERSION "$DOCKER_IMAGE_VERSION" && \
    # Generate and install favicons.
    APP_ICON_URL=https://raw.githubusercontent.com/devloic/docker-brave/refs/heads/main/brave_logo.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Metadata.
LABEL \
      org.label-schema.name="brave" \
      org.label-schema.description="Container for Brave" \
      org.label-schema.version="${DOCKER_IMAGE_VERSION:-unknown}" \
      org.label-schema.vcs-url="https://github.com/devloic/docker-brave" \
      org.label-schema.schema-version="1.0"
