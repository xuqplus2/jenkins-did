FROM jenkins/jenkins:2.180-alpine

USER root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add docker maven --update \
    && echo -e "chown jenkins:jenkins /var/run/docker.sock && su jenkins -c /usr/local/bin/jenkins.sh" > start.sh \
    && chmod 705 start.sh \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh", "start.sh"]