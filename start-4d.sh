#!/bin/bash
server=/opt/4d-server/bin/4d-server
project=`find /opt/app/ -name "*.4DProject" | head -n 1`
data=`find /opt/app/ -name "*.4DD" | head -n 1`
[[ ! -z "$data" ]] && data_param="-d "$data || data_param="--create-data"
[[ ! -z "$project" ]] &&  $server -s $project $data_param || echo "Could not find a 4D Project to be started"
