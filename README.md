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

### Trxnsaction templates 
Use  the following transaction templates to perfrom the specific transactions 

### Register a user
```sh
{
  "userId": "<user id of your choice>",
  "secret": "<some password>",
  "role": "<role>"
}
```
### Register an organization 
```sh
{
  "channelID": "cartrackingchannel",
  "ccId": "ctrack",
  "userId": "<user id registered to the organization>",
  "funcName": "registerOrg",
  "args": [
     "CARMAKER|DEALER|RTA"
  ],
  "peers": [
    "peer0.vectorcars.com|peer0.wbrta.gov.in|peer0.jamesdistributers.net"
  ]
}
```
### Create car details in the ledger ( Can only be done by an organization having CARMAKER registration)
```sh

{
	"channelID": "cartrackingchannel",
	"ccId": "ctrack",
	"userId": "<user id registered to the organization>",
	"funcName": "createCarDetails",
	"args": [{
			"chasisNumber": "100001",
			"makeYear": "2019",
			"model": "MARUTI-ALTO",
			"color": "RED"
		}
	],
	"peers": [
		"peer0.vectorcars.com"
	]
}

```

### Moodify car details in the ledger

```sh
{
	"channelID": "cartrackingchannel",
	"ccId": "ctrack",
	"userId": "<user id registered to the organization>",
	"funcName": "modifyCarDetails",
	"args": [{
			"chasisNumber": "100001",
			"dealer":"James Distributers",
			"status":"TRANSFERRED_TO_DEALER"
		}
	],
	"peers": [
		"peer0.vectorcars.com"
	]
}

```

### View car history 
```sh

{
	"channelID": "cartrackingchannel",
	"ccId": "ctrack",
	"userId": "suddutt3",
	"funcName": "queryHistory",
	"args": [ "100001"
	],
	"peers": [
		"peer0.vectorcars.com|peer0.wbrta.gov.in|peer0.jamesdistributers.net"
	]
}
```


### Full car model 

```sh
{
	"objType":"", 		# System generated
	"chasisNumber":"",  # Can not be changed and it is the primary key in ledger
	"manufacturer":"",  # System generated
	"makeYear":"",      # Can not be updated 
	"model":"",         # Can not be updated
	"color":"",         # Can not be updated
	"licNumber":"",		# License plate number
	"status":"",
	"dealer":"",
	"owner":"", 		
	"ts":"", 			# System generated
	"trxnId":"", 		# System generated
	"updBy":"", 		# System generated
}
```