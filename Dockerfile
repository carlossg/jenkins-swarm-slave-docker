FROM java:7u65

MAINTAINER Carlos Sanchez <carlos@apache.org>

ENV JENKINS_SWARM_VERSION 1.21
ENV HOME /home/jenkins-slave

RUN useradd -c "Jenkins Slave user" -d $HOME -m jenkins-slave

# Use a patched swarm client to workaround Kubernetes, the two Jenkins ports may be in different machines
# https://github.com/jenkinsci/swarm-plugin/pull/21
RUN mkdir -p /usr/share/jenkins && chmod 755 /usr/share/jenkins
COPY swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar /usr/share/jenkins/

# RUN curl --create-dirs -sSLo /usr/share/jenkins/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar \
#  && chmod 755 /usr/share/jenkins

COPY jenkins-slave.sh /usr/local/bin/jenkins-slave.sh

USER jenkins-slave

VOLUME /home/jenkins-slave

ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
