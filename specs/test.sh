#!/bin/bash

echo "Initiating tests..."
chmod -R 0777 ./
echo ">>> Docker Lints:"
./specs/generic.spec.sh
if [ $? -eq 0 ]; then
  echo ">>> Docker Lints concluded and none failed."
else
  echo ">>> Tests failed."
  exit 1
fi
echo "Initiating DockerHub builds..."
#netbox
curl --data build=true -X POST 'https://registry.hub.docker.com/u/opsforge/netbox/trigger/37279bf1-c8cb-4176-95d3-e888c74f6506/'

echo "DockerHub build triggered..."
