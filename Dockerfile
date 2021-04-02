FROM rust:1.51.0 as builder
WORKDIR /usr/src/api
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
# RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/api /usr/local/bin/api
RUN apt-get update && apt-get -y install curl
CMD ["/usr/local/bin/api"]