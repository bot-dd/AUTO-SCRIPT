# Use Ubuntu base image
FROM ubuntu:22.04

# Disable prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt update && apt install -y \
    bzip2 gzip coreutils screen curl unzip wget dos2unix iproute2 iputils-ping net-tools \
    && sysctl -w net.ipv6.conf.all.disable_ipv6=1 \
    && sysctl -w net.ipv6.conf.default.disable_ipv6=1

# Copy scripts to container
COPY start1.sh /start1.sh

# Make script executable and convert to Unix format
RUN chmod +x /start1.sh && dos2unix /start1.sh

# Set entrypoint to start1.sh
ENTRYPOINT ["/start1.sh"]
