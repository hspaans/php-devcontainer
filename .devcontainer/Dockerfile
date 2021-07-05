FROM php:8.1.0alpha2-cli

LABEL org.opencontainers.image.description="PHP devcontainer for VSCode or Codespaces"
LABEL org.opencontainers.image.source=https://github.com/hspaans/php-devcontainer

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# This Dockerfile adds a non-root user with sudo access. Use the "remoteUser"
# property in devcontainer.json to use it. On Linux, the container user's GID/UIDs
# will be updated to match your local UID/GID (when using the dockerFile property).
# See https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

COPY install-*.sh /usr/local/bin/

# Configure apt and install packages
# hadolint ignore=DL3008,DL3013,DL4006
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Install git iproute2, procps, lsb-release (useful for CLI installs)
    && apt-get -y install --no-install-recommends git iproute2 procps iproute2 lsb-release rcm \
    #
    # Set local PHP settings
    && echo "short_open_tag=off" > /usr/local/etc/php/conf.d/local.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/local.ini \
    && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/local.ini \
    #
    # Install PHP dependencies
    && apt-get -y install --no-install-recommends libzip-dev libicu-dev \
    #
    # Install PHP extension: zip
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    #
    # Install PHP extension: intl
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    #
    # Install PHP extension: opcache
    && docker-php-ext-configure opcache \
    && docker-php-ext-install opcache \
    #
    # Install PHP extension: xdebug
    && yes | pecl install xdebug \
    && docker-php-ext-enable xdebug \
    #
    # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    && groupadd --gid "$USER_GID" "$USERNAME" \
    && useradd -s /bin/bash --uid "$USER_UID" --gid "$USER_GID" -m "$USERNAME" \
    # [Optional] Add sudo support for the non-root user
    # && apt-get install -y sudo \
    # && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    # && chmod 0440 /etc/sudoers.d/$USERNAME \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && /usr/local/bin/install-composer.sh \
    && /usr/local/bin/install-symfony.sh \
    && rm /usr/local/bin/install-*.sh

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

USER vscode
ENV HOME /home/vscode
ENV PATH="/home/vscode/.symfony/bin:/home/vscode/bin:${PATH}"

