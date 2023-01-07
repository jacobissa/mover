# MOVER

MOVER watches a source directory and moves its content into a target directory

---

## Environment Variables

| Variable   | Default | Value            | Description                                                                                                                                                                                                                                                |
| ---------- | ------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TZ`       | UTC     | `TIMEZONE`       | Set your time zone to make sure logs rotate at local midnight instead of at UTC midnight. A list of all time zones can be found [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).                                                      |
| `PATTERN`  | \*      | `STRING`         | Set a pattern for the filenames. Only the files and folders that match this pattern will be moved. Default is `*` which means everything will be moved. The accepted pattern characters can be found [here](https://wiki.bash-hackers.org/syntax/pattern). |
| `INTERVAL` | 10s     | `NUMBER[SUFFIX]` | Set the time interval between scans. The `NUMBER` may be a positive integer or a floating-point Number. The `SUFFIX` may be `s` for seconds, `m` for minutes, `h` for hours or `d` for days. When no suffix is specified, it defaults to seconds.          |

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
      - PATTERN=*
      - INTERVAL=5s
    restart: unless-stopped
```

---

View on [dockerhub](https://hub.docker.com/r/jacobissa/mover) or [Github](https://github.com/jacobissa/mover)
