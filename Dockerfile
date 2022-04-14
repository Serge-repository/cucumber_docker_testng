FROM openjdk:8u212-jre-alpine3.9
# curl and jq are additional to healthcheck
RUN apk add curl jq
# Workspace in docker container
WORKDIR /usr/share/cucumber_docker
# Adding .jars, test data (orange.jpg) and dependencies from host into this image
ADD target/CucumberDocker.jar CucumberDocker.jar
ADD target/CucumberDocker-tests.jar CucumberDocker-tests.jar
ADD target/libs libs

## Add health check script (only if run from simple docker-compose up command)
ADD healthcheck.sh healthcheck.sh

## To run without healthcheck using ip or container
# Always use ":" because all containers will be running in alpine
# ENTRYPOINT java -cp MavenDocker.jar:MavenDocker-tests.jar:libs/* -Dbrowser=$browser -DHUB_HOST=$HUB_HOST -Dcucumber.options=$CUCUMBER_OPTIONS org.junit.runner.JUnitCore RunnerTest

## To run with healthcheck (only if run from simple docker-compose up command)
ENTRYPOINT sh healthcheck.sh