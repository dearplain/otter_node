#!/bin/sh
echo $NID > /node/conf/nid
sed -ri 's/(otter.manager.address = ).*/\1 "'"$MANAGER"'"/' /node/conf/otter.properties
/node/bin/startup.sh