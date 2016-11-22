# docker-postgresql

A simple project to play around with docker [PostgreSQL](https://www.postgresql.org/) container. Extends the [postgres](https://hub.docker.com/_/postgres/) image from Docker Hub to allow setting up additional users and corresponding databases on container initialization.

## Sample usage

Define two new users which should be created on the PostgreSQL server:

```
$ ./define-db-user.sh bob
$ ./define-db-user.sh ann
```
This will create a new directory with shell scripts inside:

```
db-users:
add-ann-user-and-db.sh add-bob-user-and-db.sh
```

These scripts will be copied to the customized container and executed by the database server admin user.

After that run the `dockerize.sh` script to build the custom image and run it. Resulting PostgreSQL server instance will contain two additional databases owned by corresponding users.

## Current settings

- PostgreSQL version is **9.5**,
- PostgreSQL admin user name, password and default database are all **postgres**,
- the default database server port **5432** is both forwarded to the host and exposed to other containers.
