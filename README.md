# MOVER

MOVER watches a source directory and moves its content into a target directory

---

## Environment Variables

| Variable     | Default | Value            | Description                                                                                                                                                                                                                                          |
| ------------ | ------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TZ`         | UTC     | `TimeZone`       | Set your time zone to make sure logs rotate at local midnight instead of at UTC midnight. A list of all time zones can be found [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).                                                |
| `SLEEP_SCAN` | 8s      | `NUMBER[SUFFIX]` | Set the timeout interval between scans.The `NUMBER` may be a positive integer or a floating-point Number. The `SUFFIX` may be `s` for seconds, `m` for minutes, `h` for hours or `d` for days. When no suffix is specified, it defaults to seconds.  |
| `SLEEP_MOVE` | 4s      | `NUMBER[SUFFIX]` | Set the timeout interval between moves. The `NUMBER` may be a positive integer or a floating-point Number. The `SUFFIX` may be `s` for seconds, `m` for minutes, `h` for hours or `d` for days. When no suffix is specified, it defaults to seconds. |

---

## Quick Start

Here is an example for a docker-compose.yml

```yaml
version: "3.9"

services:
  mover:
    container_name: mover
    image: jacobissa/mover:latest
    volumes:
      - /home/pi/docker/mover/source:/app/source
      - /home/pi/docker/mover/target:/app/target
      - /home/pi/docker/mover/logs:/app/logs
    environment:
      - TZ=Europe/Berlin
      - SLEEP_SCAN=6s
      - SLEEP_MOVE=3s
    restart: unless-stopped
```

---

View on [dockerhub](https://hub.docker.com/r/jacobissa/mover) or [Github](https://github.com/jacobissa/mover)
