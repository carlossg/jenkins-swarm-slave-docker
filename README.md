# Jenkins swarm slave

[`csanchez/jenkins-swarm-slave`](https://registry.hub.docker.com/u/csanchez/jenkins-swarm-slave/)

A [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave.

For a container with ssh enabled see
[`csanchez/jenkins-slave`](https://registry.hub.docker.com/u/csanchez/jenkins-slave/)

For a container with many build tools installed see
[`maestrodev/build-agent`](https://registry.hub.docker.com/u/maestrodev/build-agent/)

## Running

To run a Docker container passing [any parameters](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin#SwarmPlugin-AvailableOptions) to the slave

    docker run csanchez/jenkins-swarm-slave -master http://jenkins:8080 -username jenkins -password jenkins -executors 1

Linking to the Jenkins master container there is no need to use `--master`

    docker run -d --name jenkins -p 8080:8080 csanchez/jenkins-swarm
    docker run -d --link jenkins:jenkins csanchez/jenkins-swarm-slave -username jenkins -password jenkins -executors 1


# Building

    docker build -t csanchez/jenkins-swarm-slave .
