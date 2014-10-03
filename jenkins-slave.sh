#!/bin/sh

# jenkins swarm slave
JAR=`ls -1 /usr/share/jenkins/swarm-client-*.jar | tail -n 1`

# if using --link jenkins:jenkins
if [ ! -z "$JENKINS_PORT_8080_TCP_ADDR" ]; then
  PARAMS="-master http://$JENKINS_PORT_8080_TCP_ADDR:$JENKINS_PORT_8080_TCP_PORT"
fi

echo Running java $JAVA_OPTS -jar $JAR -fsroot $HOME $PARAMS "$@"
exec java $JAVA_OPTS -jar $JAR -fsroot $HOME $PARAMS "$@"
