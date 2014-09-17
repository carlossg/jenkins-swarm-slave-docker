# Jenkins swarm slave `csanchez/jenkins-swarm-slave`

A CentOS [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave.

For a container with many build tools installed see `maestrodev/build-agent`

## Running

To run a Docker container customizing the different tools with your credentials

    docker run \
    -e JENKINS_USERNAME=jenkins \
    -e JENKINS_PASSWORD=jenkins \
    -e JENKINS_MASTER=http://jenkins:8080 \
    maestrodev/jenkins-slave

# Building

    docker build -t csanchez/jenkins-swarm-slave .
