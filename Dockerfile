FROM bash:latest
SHELL ["/usr/local/bin/bash", "-c"]
RUN mkdir -p /app/source /app/target /app/logs /app/script;
COPY run.sh /app/script/
RUN chmod +x /app/script/run.sh
CMD /app/script/run.sh