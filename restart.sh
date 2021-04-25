#!/bin/bash

sudo docker restart ibex_api
sudo docker restart security_manager
sudo docker restart sm_api
sudo docker restart translator
sudo docker restart uploadnode
sudo docker restart processornode
sudo docker restart authnode
sudo docker restart support_tooling
sudo docker restart ibex-ingestor