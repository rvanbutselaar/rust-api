FROM rust:1.51.0 as builder
WORKDIR /usr/src/api
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/api /usr/local/bin/api
CMD ["/usr/local/bin/api"]