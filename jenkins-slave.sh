#!/bin/sh

# jenkins swarm slave
JAR=`ls -1 /usr/share/jenkins/swarm-client-*.jar | tail -n 1`

echo Running java $JAVA_OPTS -jar $JAR -fsroot $HOME "$@"
exec java $JAVA_OPTS -jar $JAR -fsroot $HOME "$@"
