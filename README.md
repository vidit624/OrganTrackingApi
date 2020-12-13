# Organ Tracking API

### Start the services

```sh
./launchservices.sh
docker-compose up -d # this will take longer duration for the first time

```

### Open a browser and open the following urls

1. http://localhost:8080 ( API for Hospital A)
2. http://localhost:8081 ( API for Hospital B)
3. http://localhost:8082 ( API for Hospital C)

### To stop the services

```sh
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
     "HospitalA|HospitalB|HospitalC"
  ],
  "peers": [
    "peer0.vectorcars.com|peer0.wbrta.gov.in|peer0.jamesdistributers.net"
  ]
}
```
### Create Organ details in the ledger ( Can be done by any Hospital)
```sh

{
	"channelID": "cartrackingchannel",
	"ccId": "ctrack",
	"userId": "<user id registered to the organization>",
	"funcName": "createOrganDetails",
	"args": [{
			"OrganType": "Heart",
			"organID": "18HT10001",
			"donationYear": "2019",
			"bloodgroup": "O+"
		}
	],
	"peers": [
		"peer0.vectorcars.com|peer0.wbrta.gov.in|peer0.jamesdistributers.net"
	]
}

```

### Moodify Organ details in the ledger

```sh
{
	"channelID": "cartrackingchannel",
	"ccId": "ctrack",
	"userId": "<user id registered to the organization>",
	"funcName": "modifyOrganDetails",
	"args": [{
			"organID": "18HT10001",
			"status":"UNAVAILABLE"
		}
	],
	"peers": [
		"peer0.vectorcars.com|peer0.wbrta.gov.in|peer0.jamesdistributers.net"
	]
}

```

### View Organ history 
```sh

{
	"channelID": "cartrackingchannel",
	"ccId": "ctrack",
	"userId": "<user id registered to the organization>",
	"funcName": "queryHistory",
	"args": [ "18HT10001"
	],
	"peers": [
		"peer0.vectorcars.com|peer0.wbrta.gov.in|peer0.jamesdistributers.net"
	]
}
```


### Full Organ model 

```sh
{
	"organType":"", 		# Can not be updated
	"organID":"",  			# Can not be changed and it is the primary key in ledger
	"donationYear":"",      # Can not be updated 
	"bloodgroup":"",        # Can not be updated
	"status":"",		
	"ts":"", 				# System generated
	"trxnId":"", 			# System generated
	"updBy":"", 			# System generated
}
```
