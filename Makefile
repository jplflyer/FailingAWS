DOCKER := $(shell which docker)
CONTAINERNAME := failing-aws
IMAGENAME := jplflyer/failing-aws
ATTACH_USER := jpl
ATTACH_HOME := /home/jpl

image: Dockerfile
		${DOCKER} image build -t ${IMAGENAME}:latest .

up: down
	${DOCKER} run -d --name ${CONTAINERNAME} ${IMAGENAME}:latest

down:
	- ${DOCKER} stop ${CONTAINERNAME}
	- ${DOCKER} rm ${CONTAINERNAME}
	- ${DOCKER} container prune -f

attach:
	${DOCKER} exec -u ${ATTACH_USER} -w ${ATTACH_HOME} -it ${CONTAINERNAME} /bin/bash -l
