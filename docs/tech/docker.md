# Docker

## Useful commands

```bash title="remove all images"
docker rmi $(docker images -a -q)
```
xxx build --force-rm --no-cache && xx up -d

```bash
docker system prune -a
```

```bash title="find images by pattern"
docker images --filter=reference=""*basdb*"
```

### postgres

```yml title="show SQL statement"
services:
  postgres:
    command: ["postgres", "-c", "log_statement=all"]
```

