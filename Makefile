.DEFAULT_GOAL := up 
SHELL := /bin/bash

clean: 
	sudo docker-compose -f common-services.yml stop
	sudo docker-compose -f common-services.yml rm -v --force

updateimgs: 
	sudo docker pull docker-local.artifactory.internetbrands.com/ingestor/authws:staging
	sudo docker pull docker-local.artifactory.internetbrands.com/ingestor/uploadws:staging
	sudo docker pull docker-local.artifactory.internetbrands.com/ingestor/logs:staging
	sudo docker pull docker-local.artifactory.internetbrands.com/security-manager:staging
	sudo docker pull docker-local.artifactory.internetbrands.com/ibex-api:staging
	sudo docker pull docker-local.artifactory.internetbrands.com/ibex-db:staging
	sudo docker pull docker-local.artifactory.internetbrands.com/ibex-log-db:staging
	sudo docker pull docker-local.artifactory.internetbrands.com/ingestor/liquibase:staging
	- sudo docker images -f "dangling=true" -q | xargs sudo docker rmi -f
	
up:	
	sudo docker-compose -f common-services.yml up -d

prepdb: 
	sudo docker exec persist_db /mnt/scripts/grantaccess.sh
	sudo docker exec log_db /mnt/scripts/grantaccess.sh
	- sudo docker run --rm --link persist_db docker-local.artifactory.internetbrands.com/ingestor/liquibase:staging java -jar schema-update-1.0.0-jar-with-dependencies.jar --driver=org.postgresql.Driver --changeLogFile=liquibase/db.changelog.xml --url="jdbc:postgresql://persist_db:5432/ibex?currentSchema=ibex" --username=postgres --password= update
	- sudo docker run --rm --link log_db docker-local.artifactory.internetbrands.com/ingestor/liquibase:staging java -jar schema-update-1.0.0-jar-with-dependencies.jar --driver=org.postgresql.Driver --changeLogFile=liquibase/logdb.changelog.xml --url="jdbc:postgresql://log_db:5432/ibex_logs?currentSchema=ibex_logs" --username=postgres --password= update
	sudo docker exec persist_db psql -U postgres -d ibex -f /mnt/scripts/initdata.sql

.dummy:	up