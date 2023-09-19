#!/bin/bash

DIR="/home/nodeos"

if [ -f $DIR"/nodeos.pid" ]; then
  pid=`cat $DIR"/nodeos.pid"`
  kill $pid

  printf "Stopping Nodeos [$pid]"

  while true; do
      [ ! -d "/proc/$pid/fd" ] && break
      printf "."
      sleep 1
  done
  printf "\n"
  rm -r $DIR"/nodeos.pid"

  # DATE=$(date -d "now" +'%Y_%m_%d-%H_%M')
  # if [ ! -d $DIR/logs ]; then
  #     mkdir $DIR/logs
  # fi
  # tar -pcvzf $DIR/logs/stderr-$DATE.txt.tar.gz stderr.txt

  printf "\rNodeos Stopped.    \n"
fi
