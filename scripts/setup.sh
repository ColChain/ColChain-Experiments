#!/bin/bash

config=$1
data=$2
setup=$3
length=$4

for i in {000..127}
do
  echo "Starting server 3${i}"
  ii=$(echo $i | sed 's/^0*//')
  nohup curl "http://172.21.232.208:3${i}/experiments?mode=start&config=${config}&dir=${data}&setup=${setup}&id=${ii}&nodes=128&chain=${length}" > curl_${i} &
done
