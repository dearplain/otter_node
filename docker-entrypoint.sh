#!/bin/bash
echo $NID > /node/conf/nid
echo NID: $NID
echo MaxMem: $MaxMem
if [ -z "$MaxMem" ];then
	MaxMem=3072m
else
    sed -i s/"-server -Xms32m -Xmx3072m"/"-server -Xms32m -Xmx$MaxMem"/g /node/bin/startup.sh
fi
sed -ri "s/(otter.manager.address).*/\1 = $MANAGER/" /node/conf/otter.properties
/node/bin/stop.sh
/node/bin/startup.sh
trap 'echo stop node; /node/bin/stop.sh' TERM
# tail -f /dev/null & wait
sleep 2
tail -f /node/logs/node/node.log & wait