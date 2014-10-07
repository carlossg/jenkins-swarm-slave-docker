#!/bin/bash

# jenkins swarm slave
JAR=`ls -1 /usr/share/jenkins/swarm-client-*.jar | tail -n 1`

# if using --link jenkins:jenkins
if [ ! -z "$JENKINS_PORT_8080_TCP_ADDR" ]; then
  PARAMS="-master http://$JENKINS_PORT_8080_TCP_ADDR:$JENKINS_PORT_8080_TCP_PORT"
fi

# if `docker run` first argument start with `-` the user is passing jenkins swarm launcher arguments
if [[ $# -lt 1 ]] || [[ "$1" == "-"* ]]; then
  echo Running java $JAVA_OPTS -jar $JAR -fsroot $HOME $PARAMS "$@"
  exec java $JAVA_OPTS -jar $JAR -fsroot $HOME $PARAMS "$@"
fi

# As argument is not jenkins, assume user want to run his own process, for sample a `bash` shell to explore this image
exec $@
