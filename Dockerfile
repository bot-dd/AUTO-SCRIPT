FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Disable IPv6 and install required packages
RUN apt update && apt install -y \
    bzip2 gzip coreutils screen curl unzip wget dos2unix iproute2 iputils-ping net-tools && \
    sysctl -w net.ipv6.conf.all.disable_ipv6=1 && \
    sysctl -w net.ipv6.conf.default.disable_ipv6=1

# Copy setup script
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh && dos2unix /setup.sh

# Run setup script
RUN bash /setup1.sh

CMD ["tail", "-f", "/dev/null"]
