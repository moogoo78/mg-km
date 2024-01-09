# Docker


## Tutorials

## Learning
- [Docker Context | Docker Documentation](https://docs.docker.com/engine/context/working-with-contexts/)
- [Dockerfile - ENV與ARG參數 · Docker學習筆記](https://peihsinsu.gitbooks.io/docker-note-book/content/dockerfile-env-vs-arg.html)

## Dockerfile Best Practices
- [Best practices for writing Dockerfiles | Docker Documentation](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

- [Speed Up Your Development Flow With These Dockerfile Best Practices | Docker](https://www.docker.com/blog/speed-up-your-development-flow-with-these-dockerfile-best-practices/)



## How-Tos

- [Run x86 Docker containers with Rosetta on Mac | Level Up Coding](https://levelup.gitconnected.com/docker-on-apple-silicon-mac-how-to-run-x86-containers-with-rosetta-2-4a679913a0d5) ⇒ 影響套件: geopandas, pillow Feb 9, 2023


### Python

[python-env-series Archives | Docker](https://www.docker.com/blog/tag/python-env-series/)

- [Containerized Python Development - Part 1 | Docker](https://www.docker.com/blog/containerized-python-development-part-1/)

   - multi stage (builder & slim)

- [Containerized Python Development - Part 2 | Docker](https://www.docker.com/blog/containerized-python-development-part-2/)

   - docker compose

      - network seperation: frontend & backend

      - secrets (db-password)

- part3: visual studio code debug (pvsd)



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

