#!/bin/bash

i=1
for f in files/*.hdt; do
    j=$(printf 3"%03d\n" $i)
    
    COLCHAIN_PORT=${j} docker-compose --project-name "colchain_${i}" kill

    echo "$f;$j"
    i=$((i+1))
done

docker container prune -f
