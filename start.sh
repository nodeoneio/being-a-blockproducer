#!/bin/bash

# option
# 스냅샷에서 시작할 경우: -s [snapshot path]
# Genesis.json 에서 시작할 경우: -g [genesis.json path]

NODEOSBINDIR="/usr/bin"
DATADIR="/home/nodeos"
SNAPSHOT=""
GENESIS=""

$DATADIR/stop.sh
printf "Starting Nodeos \n";

ulimit -n 65535
ulimit -s 64000

while getopts g:s: flag
do
    case "${flag}" in
        s) SNAPSHOT="--snapshot ${OPTARG}";;
        g) GENESIS="--genesis-json ${OPTARG}";;
    esac
done

$NODEOSBINDIR/nodeos $GENESIS $SNAPSHOT --data-dir $DATADIR --config-dir $DATADIR 2>> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
