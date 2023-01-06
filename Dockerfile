FROM bash:latest
RUN apk add --no-cache tzdata
ENV TZ=UTC
ENV SLEEP_SCAN=8s
ENV SLEEP_MOVE=4s
RUN mkdir -p /app/source /app/target /app/logs;
COPY script.sh /
CMD ["bash", "/script.sh"]