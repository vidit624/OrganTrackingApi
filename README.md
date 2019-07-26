# Hyperledger fabric REST API

### Setup 

1. Add following /etc/hosts entries 

```sh
sudo nano /etc/hosts
# Append the following line in the /etc/hosts. Save it 
127.0.0.1       ca.vectorcars.com
127.0.0.1       ca.wbrta.gov.in
127.0.0.1       ca.jamesdistributers.net
127.0.0.1       peer0.vectorcars.com
127.0.0.1       peer0.wbrta.gov.in
127.0.0.1       peer0.jamesdistributers.net
127.0.0.1       orderer.carscm.net


```

2. Download the API setup 

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
./launchservices.sh
docker-compose up -d # this will take longer duration for the first time

```

### Open a browser and open the following urls

1. http://localhost:8080 ( API for Car Manufacturer)
2. http://localhost:8081 ( API for WB RTA)
3. http://localhost:8082 ( API for Car Delaer)

### To stop the services

```sh
cd $HOME/projects/cartrack/api

./stopServices.sh

docker-compose down

```