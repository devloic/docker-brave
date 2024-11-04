#
# brave Dockerfile
#
# https://github.com/devloic/docker-brave
#

# Pull base image.
FROM jlesage/baseimage-gui:alpine-3.20-v4

# Docker image version is provided via build arg.
ARG DOCKER_IMAGE_VERSION=

# Define working directory.
WORKDIR /tmp
#COPY rootfs/ /

RUN \
    add-pkg flatpak \
     # WebGL support.
        mesa-dri-gallium \
        # Audio support.
        libpulse \
        # Icons used by folder/file selection window (when saving as).
        adwaita-icon-theme \
        # A font is needed.
        font-dejavu \
        # The following package is used to send key presses to the X process.
        xdotool \
        xdg-dbus-proxy \
        dbus-x11 \
        && \
    # Remove unneeded icons.
    find /usr/share/icons/Adwaita -type d -mindepth 1 -maxdepth 1 -not -name 16x16 -not -name scalable -exec rm -rf {} ';' && \
    flatpak remote-add  --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak install -y flathub org.freedesktop.Platform/x86_64/24.08 com.brave.Browser && \
    true

# Generate and install favicons.
#RUN \
 #   APP_ICON_URL=https://github.com/jlesage/docker-templates/raw/master/jlesage/images/firefox-icon.png && \
  #  install_app_icon.sh "$APP_ICON_URL"

# Set internal environment variables.
RUN \
    set-cont-env APP_NAME "Brave" && \
    set-cont-env APP_VERSION "$(flatpak list | grep brave | awk '{print $3}')" && \
    set-cont-env DOCKER_IMAGE_VERSION "$DOCKER_IMAGE_VERSION" && \
    true

RUN chmod u+s /usr/bin/bwrap
# Metadata.
LABEL \
      org.label-schema.name="brave" \
      org.label-schema.description="Docker container for Brave" \
      org.label-schema.version="${DOCKER_IMAGE_VERSION:-unknown}" \
      org.label-schema.vcs-url="https://github.com/devloic/docker-brave" \
      org.label-schema.schema-version="1.0"
COPY rootfs/ /
COPY rootfs/ /
COPY rootfs/ /
COPY rootfs/ /
