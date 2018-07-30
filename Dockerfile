FROM postgres:9.6.7
LABEL maintainer="Tim Kolotov <timophey.kolotov@gmail.com>"

RUN apt-get update \
    && apt-get -y install gcc cpp make wget postgresql-server-dev-9.6 \
    && wget --no-check-certificate https://github.com/eulerto/pg_similarity/archive/pg_similarity_1_0.tar.gz \
    && tar -xf pg_similarity_1_0.tar.gz && cd pg_similarity-pg_similarity_1_0 \
    && USE_PGXS=1 make && USE_PGXS=1 make install \
    && apt-get -y autoremove gcc make cpp wget postgresql-server-dev-9.6 \
    && apt-get clean all && rm -rf /var/lib/apt/lists /pg_similarity-pg_similarity_1_0
