# Build stage
FROM gcc:latest AS builder
WORKDIR /app
COPY main.c .
RUN gcc -o app main.c

# Run stage
FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /app/app .
CMD ["./app"]
