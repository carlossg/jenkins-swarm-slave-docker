# Jenkins swarm slave

[`csanchez/jenkins-swarm-slave`](https://registry.hub.docker.com/u/csanchez/jenkins-swarm-slave/)

A [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave.

For a container with many build tools installed see `maestrodev/build-agent`

## Running

To run a Docker container passing any parameters to the slave

    docker run csanchez/jenkins-swarm-slave -master http://jenkins:8080 -username jenkins --password jenkins

Linking to the Jenkins master container there is no need to use `--master`

    docker run --name jenkins -p 8080:8080 -p 37727:37727 -p 50000:50000 csanchez/jenkins-swarm
    docker run --link jenkins:jenkins csanchez/jenkins-swarm-slave -username jenkins --password jenkins


# Building

    docker build -t csanchez/jenkins-swarm-slave .
