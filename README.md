## Dockerizing and Angular App

This repo shows how to create a Dockerfile for an Angular application. The instructions below explain how to create a Docker image and run it in a container.

This post on [dockerizing an Angular App was helpful](https://mherman.org/blog/dockerizing-an-angular-app/)

## Build Docker Image

```
docker build --tag mb/docker-angular . --target dev
or
docker build --tag mb/docker-angular-test . --target test
```

## Run Docker Image

Run in foreground w/ interactive terminal

```
docker run -it --publish 4200:4200 mb/docker-angular

# for tests
docker run -it mb/docker-angular-test
```

> **NOTE**: Give it time to boot up!

To run in background/detached mode

```
docker run --detach --publish 4200:4200 mb/docker-angular

or
docker run --name my_container --detach --publish 4200:4200 mb/docker-angular
```

> **NOTE**: it doesn't make sense to run tests in detached mode because typically want to see the log output results of the tests
