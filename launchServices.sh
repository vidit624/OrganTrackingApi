#!/bin/bash
rm *.log
nohup ./xclient -p=9090 ../network/connection-profile-vc.yaml > vcapi.log 2>&1 &
nohup ./xclient -p=9091 ../network/connection-profile-wbrta.yaml > wbrtaapi.log 2>&1 &
nohup ./xclient -p=9092 ../network/connection-profile-jd.yaml > jdapi.log 2>&1 &