.DEFAULT_GOAL := up
SHELL := /bin/bash

clean:
	sudo docker-compose -f common-services.yml down --remove-orphans

updateimgs:
	- sudo docker pull docker-local.artifactory.internetbrands.com/ibex_authws:staging
	- sudo docker pull docker-local.artifactory.internetbrands.com/ibex_uploadws:staging
	- sudo docker pull docker-local.artifactory.internetbrands.com/ibex_upload_processor:staging
	- sudo docker pull docker-local.artifactory.internetbrands.com/ibex_upload_logs:staging
	- sudo docker pull docker-local.artifactory.internetbrands.com/udbf_translator:staging
	- sudo docker pull docker-local.artifactory.internetbrands.com/security-manager:staging
	- sudo docker pull docker-local.artifactory.internetbrands.com/ibex-api:staging
	- sudo docker pull docker-local.artifactory.internetbrands.com/sm-api:staging
	- sudo docker pull docker-local.artifactory.internetbrands.com/ibex/postgres_11.4_with_schema:latest
	- sudo docker pull docker-local.artifactory.internetbrands.com/demandforce/cp-kafka-including-schema
	- sudo docker pull confluentinc/cp-zookeeper
	- sudo docker pull confluentinc/cp-schema-registry
	- sudo docker pull confluentinc/cp-kafka-rest
	- sudo docker pull memcached
	- sudo docker pull landoop/kafka-topics-ui
	- sudo docker images -f "dangling=true" -q | xargs sudo docker rmi -f

up:
	sudo docker-compose -f common-services.yml up -d

prepdb:
	sudo docker exec ibex_db /mnt/scripts/grantaccess.sh
	sudo docker exec ibex_db psql -U postgres -c "SELECT pg_reload_conf();"
	sudo docker exec ibex_db psql -U postgres -d ibex -f /mnt/scripts/initdata.sql
	sudo docker exec ibex_db psql -U postgres -c "CREATE DATABASE sm_api_db;"
	sudo docker exec ibex_db psql -U postgres -d sm_api_db -f /mnt/scripts/sm_api_schema.sql

.dummy:	up
