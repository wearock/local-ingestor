.DEFAULT_GOAL := up 
SHELL := /bin/bash

clean: 
	sudo docker-compose -f common-services.yml stop
	sudo docker-compose -f common-services.yml rm -v --force

updateimgs: 
	sudo docker pull docker-local.artifactory.internetbrands.com/ibex-db:staging
	sudo docker pull docker-local.artifactory.internetbrands.com/ibex-log-db:staging
	sudo docker pull docker-local.artifactory.internetbrands.com/ingestor/liquibase:staging
    - sudo docker images -f "dangling=true" -q' | xargs sudo docker rmi -f
	
up:	
	sudo docker-compose -f common-services.yml up -d

.dummy:	up