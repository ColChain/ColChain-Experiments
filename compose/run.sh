#!/bin/bash

ip=$1

# Start nodes, create a community, and observer the other communities
echo "Starting nodes..."
i=0
for f in files/*.hdt; do
    j=$(printf 3"%03d\n" $i)
    echo "$f;$j"
    i=$((i+1))
    
    COLCHAIN_PORT=${j} docker-compose --project-name "colchain_${i}" up -d
    sleep 10
    curl -s -o /dev/null "http://${ip}:${j}/?mode=config&config=/data/config.json"
    cname="community${i}"
    curl -s -o /dev/null "http://${ip}:${j}/api/community?mode=createid&name=${f}&id=${cname}"
    curl -s -o /dev/null "http://${ip}:${j}/api/upload?path=/data/${f}&community=${cname}"
done

echo "Observing the other communities..."

k=0
for f in files/*.hdt; do
    j=$(printf 3"%03d\n" $k)
    echo "For node on port $j"
    l=$((k+1))
    
    cname="community${l}"
    
    for m in $(seq 0 1 $((i-1))); do
        jj=$(printf 3"%03d\n" $m)
        if [ $j -eq $jj ]
        then
            continue
        fi
        echo "Observing community on port $jj"
        cname="community$((m+1))"
        echo "http://${ip}:${j}/api/community?mode=observe&id=${cname}&address=http://${ip}:${jj}"
        curl -s -o /dev/null "http://${ip}:${j}/api/community?mode=observe&id=${cname}&address=http://${ip}:${jj}"
    done
    
    k=${l}
done

echo "done!"
