# Define postgres server version
FROM postgres:9.5

# Copy all user definition scripts into the container
COPY db-users/ /docker-entrypoint-initdb.d/

