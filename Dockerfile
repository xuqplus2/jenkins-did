FROM jenkins:2.60.3-alpine

USER root

RUN apk add docker --update \
    && echo -e "chown jenkins:jenkins /var/run/docker.sock && su jenkins -c /usr/local/bin/jenkins.sh" > start.sh \
    && chmod 705 start.sh \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh", "start.sh"]