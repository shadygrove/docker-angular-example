

## Build Docker Image
```
docker build --tag mb/docker-angular .
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

Run in background/detached mode
```
docker run --detach --publish 4200:4200 mb/docker-angular 

or 
docker run --name my_container --detach --publish 4200:4200 mb/docker-angular
```