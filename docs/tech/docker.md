# Docker

## Useful commands

```bash title="remove all images"
docker rmi $(docker images -a -q)
```
xxx build --force-rm --no-cache && xx up -d

```
docker system prune -a
```

### postgres

```yml title="show SQL statement"
services:
  postgres:
    command: ["postgres", "-c", "log_statement=all"]
```

