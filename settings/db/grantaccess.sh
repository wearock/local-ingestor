#!/bin/bash

echo "host all all    10.20.0.0/16   trust">>/var/lib/pgsql/9.6/data/pg_hba.conf
/usr/pgsql-9.6/bin/pg_ctl reload -D /var/lib/pgsql/9.6/data/