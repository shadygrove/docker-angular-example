

## Build Docker Image
```
docker build --tag mb/docker-angular .
```

## Run Docker Image
```
docker run --detach --publish 4200:4200 mb/docker-angular --name mb_angular
```