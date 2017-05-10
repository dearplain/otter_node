#!/bin/bash
echo $NID > /node/conf/nid
sed -ri "s/(otter.manager.address).*/\1 = $MANAGER/" /node/conf/otter.properties
/node/bin/startup.sh
trap 'echo stop node; cd /node/bin; ./stop.sh' TERM
tail -f /dev/null & wait