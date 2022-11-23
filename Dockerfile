######################## Base Args ########################
ARG BASE_REGISTRY=docker.io
ARG BASE_IMAGE=zarguell/ubi8
ARG BASE_TAG=latest 

ENV SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

USER 0

RUN dnf update -y --nodocs && \
    dnf install -y --nodocs \
       squid && \
    dnf clean all && \
    rm -rf /var/cache/dnf

RUN groupadd -g 1001 proxy && \
    useradd -r -u 1001 -m -s /sbin/nologin -g proxy proxy

COPY scripts/entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

USER 1001

ENTRYPOINT ["/sbin/entrypoint.sh"]

HEALTHCHECK NONE