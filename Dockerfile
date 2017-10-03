FROM debian:jessie

WORKDIR /workdir
ENV LINUX=/workdir/rpi64-linux

# Install build dependencies
RUN apt-get update && \
  apt-get install -y bc build-essential curl git-core libncurses5-dev module-init-tools

# Install crosscompile toolchain for ARM64/aarch64
RUN mkdir -p /opt/linaro && \
  curl -sSL http://releases.linaro.org/components/toolchain/binaries/7.1-2017.08/aarch64-linux-gnu/gcc-linaro-7.1.1-2017.08-x86_64_aarch64-linux-gnu.tar.xz | tar xfJ - -C /opt/linaro
ENV CROSS_COMPILE=/opt/linaro/gcc-linaro-7.1.1-2017.08-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-

# Get the Linux kernel 4.9 source
RUN git clone --single-branch --branch rpi-4.9.y --depth 1 https://www.github.com/raspberrypi/linux $LINUX

COPY defconfigs/ /defconfigs/
COPY build-kernel.sh /
CMD ["/build-kernel.sh"]
