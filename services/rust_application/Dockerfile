# --- Build Image
FROM rust:latest as cargo-build

## Update cargo-build
RUN apt-get update

## Install required C libraries
RUN apt-get install -y cmake musl-tools libhwloc-dev hwloc

## Test hwloc lib
RUN lstopo

## Install musl-gcc
# Couldn't find a way to cross-compile a static binary
#RUN git clone git://git.musl-libc.org/musl
#WORKDIR /musl
#RUN ./configure --prefix=/usr/src/rust_application
#RUN make install
#RUN musl-gcc --version

## Copy local files to WORKDIR
COPY . /usr/src/rust_application

## Set WORKDIR
WORKDIR /usr/src/rust_application

## Setup rustlang for cross-platform-compilation
RUN rustup target add x86_64-unknown-linux-musl

## Build rust-application 
#RUN CC_x86_64_unknown_linux_musl="x86_64-linux-musl-gcc" \
#    cargo build --target x86_64-unknown-linux-musl --release
RUN cargo build --target x86_64-unknown-linux-musl --release

# Check if binary is built correctly
RUN file /usr/src/rust_application/target/x86_64-unknown-linux-musl/release/rust_application

# --- Release Image
FROM alpine:latest

# Upgrade all system packages
RUN apk --no-cache update && \
    apk --no-cache upgrade

# Set WORKDIR
WORKDIR /home/rust_application/bin/

# Copy binaries from cargo-build
COPY --from=cargo-build \
        /usr/src/rust_application/target/x86_64-unknown-linux-musl/release/rust_application \
        .

# Copy entrypoint shell script
COPY ./entrypoint.sh .

# set entrypoint.sh file permissions
RUN chmod +x /home/rust_application/bin/entrypoint.sh

# Entrypoint
CMD ["/home/rust_application/bin/entrypoint.sh"]