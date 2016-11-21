#!/bin/bash
set -e

if [ -z "$1" ];
then
    echo "User name not provided"
    exit -1
fi

if ! [ -d "db-users" ];
then
    mkdir "db-users"
fi

USER_NAME="$1"

cat > "db-users/add-$USER_NAME-user-and-db.sh" <<-EOSCRIPT
#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "\$POSTGRES_USER" <<-EOSQL
    CREATE USER $USER_NAME WITH PASSWORD '$USER_NAME';
    CREATE DATABASE $USER_NAME;
    GRANT ALL PRIVILEGES ON DATABASE $USER_NAME TO $USER_NAME;
EOSQL
EOSCRIPT

