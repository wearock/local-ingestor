#!/bin/bash

echo -n "Delete current storage"
sudo rm -f -r /var/shared/ingestor

echo -n "Recreate root folder"
sudo mkdir /var/shared/ingestor

echo -n "Recreate logs folder structure"
sudo mkdir /var/shared/ingestor/logs
sudo mkdir /var/shared/ingestor/logs/facade
sudo mkdir /var/shared/ingestor/logs/translator
sudo mkdir /var/shared/ingestor/logs/conductor
sudo mkdir /var/shared/ingestor/logs/ibex-api
sudo mkdir /var/shared/ingestor/logs/ibconnect

echo -n "Recreate storage folder structure"
sudo mkdir /var/shared/ingestor/storage
sudo mkdir /var/shared/ingestor/storage/sesame
sudo mkdir /var/shared/ingestor/storage/sesame/system
sudo mkdir /var/shared/ingestor/storage/sesame/common
sudo mkdir /var/shared/ingestor/storage/sesame/localstore
sudo mkdir /var/shared/ingestor/storage/translated
sudo mkdir /var/shared/ingestor/storage/ibconnect
sudo mkdir /var/shared/ingestor/storage/d3
sudo mkdir /var/shared/ingestor/storage/d3/received
sudo mkdir /var/shared/ingestor/storage/d3/uploaded

echo -n "All Done!"