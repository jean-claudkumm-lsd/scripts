#!/bin/bash
>used-images.txt
kubectl get po -A --no-headers | awk {' print $2,$1'} | while read -r pod ns;
do
	value=$(kubectl get po $pod -n $ns -o jsonpath="{.status.containerStatuses[].imageID}")
	if [[ $value != "" ]]; then
		echo $value >> used-images.txt;
	fi

done;
