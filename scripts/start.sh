#!/bin/bash

for i in {000..127}
do
  echo "Starting server 3${i}"
  nohup java -Xmx200G -jar start.jar -Djetty.port=3${i} > out_${i} &
done
