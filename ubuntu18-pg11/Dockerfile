FROM ubuntu:18.04

ENV POSTGRES_VERSION=11

RUN apt-get update \
    && apt-get install -y wget gnupg2 apt-transport-https \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && echo "deb https://jabbors.github.io/postgres-decoderbufs/repo bionic main" > /etc/apt/sources.list.d/postgres_decoderbufs.list \
    && wget --quiet -O - https://jabbors.github.io/postgres-decoderbufs/repo/A037B18F.asc | apt-key add -

RUN apt-get update \
    && apt-get install -y postgresql-${POSTGRES_VERSION} postgresql-${POSTGRES_VERSION}-wal2json postgresql-${POSTGRES_VERSION}-decoderbufs

COPY ./user-pg.conf /user-pg.conf
RUN echo "include_if_exists = '/user-pg.conf'" >> /etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf
RUN echo "host all all all trust" >> /etc/postgresql/${POSTGRES_VERSION}/main/pg_hba.conf

USER postgres:ssl-cert
CMD [ "/usr/lib/postgresql/11/bin/postgres", "-D", "/var/lib/postgresql/11/main", "-c", "config_file=/etc/postgresql/11/main/postgresql.conf" ]
EXPOSE 5432