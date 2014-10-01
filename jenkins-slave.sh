#!/bin/sh

# jenkins swarm slave
JAR=`ls -1 $HOME/swarm-client-*.jar | tail -n 1`

PARAMS=""
if [ ! -z "$JENKINS_USERNAME" ]; then
  PARAMS="$PARAMS -username $JENKINS_USERNAME"
fi
if [ ! -z "$JENKINS_PASSWORD" ]; then
  PARAMS="$PARAMS -password $JENKINS_PASSWORD"
fi
if [ ! -z "$JENKINS_MASTER" ]; then
  PARAMS="$PARAMS -master $JENKINS_MASTER"
else
  if [ ! -z "$JENKINS_SERVICE_PORT" ]; then
    # kubernetes environment variable
    PARAMS="$PARAMS -master http://$SERVICE_HOST:$JENKINS_SERVICE_PORT"
  fi
fi

java -jar $JAR $PARAMS -fsroot $HOME
