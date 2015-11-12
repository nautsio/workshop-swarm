#!/usr/bin/env bash
MACHINE_PREFIX=$1
MACHINE_ID=$2
NUM_INSTANCES=$3

generateNodeHostsLine() {
  local IP="172.16.8.$((100+$1))"
  local HOST=$(printf "$MACHINE_PREFIX-%02d" $1)
  echo "$IP   $HOST"
}

writeConsulNodeConfig() {
  local BINDADDR="172.16.8.$((100+$MACHINE_ID))"
  if [ $MACHINE_ID == 1 ]; then
    printf '{"bootstrap": true, "bind_addr": "%s", "client_addr": "%s"}' $BINDADDR $BINDADDR | jq . > /etc/consul.d/node.json
  else
    printf '{"start_join": ["172.16.8.101"], "bind_addr": "%s", "client_addr": "%s"}' $BINDADDR $BINDADDR | jq . > /etc/consul.d/node.json
  fi
}

function writeHostsFile() {
  local LOCALHOST="127.0.0.1    localhost"
  echo $LOCALHOST > /etc/hosts
  for ((i=1; i<=$NUM_INSTANCES; i++))
  do
    echo $(generateNodeHostsLine $i) >> /etc/hosts
  done
}

writeHostsFile
writeConsulNodeConfig

sudo service consul restart
