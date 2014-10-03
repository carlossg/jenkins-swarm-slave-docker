# Jenkins swarm slave

[`csanchez/jenkins-swarm-slave`](https://registry.hub.docker.com/u/csanchez/jenkins-swarm-slave/)

A [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave.

For a container with many build tools installed see `maestrodev/build-agent`

## Running

To run a Docker container passing any parameters to the slave

    docker run csanchez/jenkins-swarm-slave -master http://jenkins:8080 -username jenkins --password jenkins

# Building

    docker build -t csanchez/jenkins-swarm-slave .
