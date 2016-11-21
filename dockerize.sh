#!/bin/bash
set -e

echo "Build custom postgres image with user definition scripts from db-users"
docker build --tag postgres-9.5 .

echo "Run the customized container"
docker run --name postgres-9.5 -e POSTGRES_PASSWORD=postgres -d -p 5432:5432 postgres-9.5

