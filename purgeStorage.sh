#!/bin/bash

echo -n "Delete current storage"
rm -f -r /var/shared/ingestor

echo -n "Recreate root folder"
mkdir /var/shared/ingestor

echo -n "Recreate logs folder structure"
mkdir /var/shared/ingestor/logs
mkdir /var/shared/ingestor/logs/facade
mkdir /var/shared/ingestor/logs/translator
mkdir /var/shared/ingestor/logs/conductor
mkdir /var/shared/ingestor/logs/ibex-api

echo -n "Recreate storage folder structure"
mkdir /var/shared/ingestor/storage
mkdir /var/shared/ingestor/storage/sesame
mkdir /var/shared/ingestor/storage/sesame/system
mkdir /var/shared/ingestor/storage/sesame/common
mkdir /var/shared/ingestor/storage/sesame/localstore
mkdir /var/shared/ingestor/storage/translated
mkdir /var/shared/ingestor/storage/d3
mkdir /var/shared/ingestor/storage/d3/received
mkdir /var/shared/ingestor/storage/d3/uploaded

echo -n "All Done!"