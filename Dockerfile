FROM centos:centos6

MAINTAINER Carlos Sanchez <carlos@apache.org>

ENV VERSION 1.16
ENV HOME /home/jenkins-slave

#ENV JENKINS_USERNAME jenkins
#ENV JENKINS_PASSWORD jenkins
#ENV JENKINS_MASTER http://jenkins:8080

RUN yum install -y java-1.7.0-openjdk-devel && yum clean all
RUN useradd -c "Jenkins Slave user" -d $HOME -m jenkins-slave
RUN curl -sSLo $HOME/swarm-client-$VERSION-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$VERSION/swarm-client-$VERSION-jar-with-dependencies.jar

COPY jenkins-slave.sh /usr/local/bin/jenkins-slave.sh

USER jenkins-slave

CMD ["/usr/local/bin/jenkins-slave.sh"]
