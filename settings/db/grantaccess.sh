#!/bin/bash

echo "host all all    10.20.0.0/16   trust">>/data/pg_hba.conf
/usr/lib/postgresql/10/bin/pg_ctl reload -D /var/lib/pgsql/9.6/data/
