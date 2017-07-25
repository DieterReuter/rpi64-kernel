FROM debian:jessie

# Install build dependencies
RUN apt-get update && \
  apt-get install -y bc build-essential curl git-core libncurses5-dev module-init-tools

# Install crosscompile toolchain for ARM64/aarch64
RUN mkdir -p /opt/linaro && \
  curl -sSL http://releases.linaro.org/components/toolchain/binaries/6.2-2016.11/aarch64-linux-gnu/gcc-linaro-6.2.1-2016.11-x86_64_aarch64-linux-gnu.tar.xz | tar xfJ - -C /opt/linaro
ENV CROSS_COMPILE=/opt/linaro/gcc-linaro-6.2.1-2016.11-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-

# Get the Linux kernel 4.12.3 source
WORKDIR /workdir
ENV LINUX=/workdir/linux-4.12.3
RUN curl -sSL https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.12.3.tar.xz | tar xfJ -

COPY defconfigs/ /defconfigs/
COPY build-kernel.sh /
CMD ["/build-kernel.sh"]
