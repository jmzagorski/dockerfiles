# Force
FROM alpine:latest

WORKDIR /app
COPY jwtgen.sh /app
RUN apk add --no-cache bash openssl
RUN chmod +x /app/jwtgen.sh

ENTRYPOINT ["/app/jwtgen.sh"]
