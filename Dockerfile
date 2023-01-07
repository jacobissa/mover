FROM bash:latest
RUN apk add --no-cache tzdata
ENV TZ=UTC
ENV PATTERN=*
ENV INTERVAL=10s
RUN mkdir -p /app/source /app/target /app/logs;
COPY script.sh /
CMD ["bash", "/script.sh"]