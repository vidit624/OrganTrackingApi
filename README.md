# Hyperledger fabric REST API

### Setup 

```sh

cd $HOME
mkdir -p projects/cartrack/api
cd projects/cartrack/api
git clone https://github.com/suddutt1/workshopapi.git . # Do not miss the DOT(,) at the end
chmod +x *.sh

```

### Start the services

```sh
cd $HOME/projects/cartrack/api

docker-compose up -d # this will take longer duration for the first time

./launchservices.sh
```

### Open a browser and open the following urls

1. http://localhost:8080 ( API for Car Manufacturer)
2. http://localhost:8081 ( API for WB RTA)
3. http://localhost:8082 ( API for Car Delaer)
