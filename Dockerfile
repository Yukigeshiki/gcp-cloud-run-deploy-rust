# Start with a rust alpine image
FROM rust:1-alpine3.15 AS builder

# This is important, see https://github.com/rust-lang/docker-rust/issues/85
ENV RUSTFLAGS="-C target-feature=-crt-static"

# if needed, add additional dependencies here
RUN apk add --no-cache musl-dev

# set the workdir and copy the source into it
WORKDIR /app
COPY ./ /app

# do a release build
RUN cargo build --release
RUN strip target/release/rocket-app

# use a plain alpine image, the alpine version needs to match the builder
FROM alpine:3.15

# if needed, install additional dependencies here
RUN apk add --no-cache libgcc

COPY --from=builder /app/target/release/rocket-app /usr/local/bin/

ENV ROCKET_ADDRESS=0.0.0.0
ENV ROCKET_PORT=8080

WORKDIR /root

# set the binary as entrypoint
CMD /usr/local/bin/rocket-app
