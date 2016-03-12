#!/bin/bash

RUNDIR=/var/run/sensu-server
PIDFILE=$RUNDIR/sensu-server.pid

mkdir -p $RUNDIR
touch $PIDFILE
chown sensu:sensu $RUNDIR $PIDFILE
chmod 755 $RUNDIR


exec /opt/sensu/bin/sensu-server -d /etc/sensu -p $PIDFILE &
sleep 5

exec /opt/sensu/bin/sensu-api -d /etc/sensu