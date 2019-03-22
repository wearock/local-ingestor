#!/bin/bash

echo "host all all    10.20.0.0/16   trust">>/data/pg_hba.conf
su - postgres -c "PGDATA=$PGDATA /usr/lib/postgresql/10/bin/pg_ctl -w restart"
