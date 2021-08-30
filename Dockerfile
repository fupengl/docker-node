FROM mhart/alpine-node:14

# Install rsync and SSH.
RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
            bash \
            rsync \
            openssh-client \
            git \
            ca-certificates \
 && update-ca-certificates \
 && npm i pnpm -g

COPY docker-entrypoint.sh /usr/local/bin/
COPY git-bash-helper.sh /root/
ENTRYPOINT ["docker-entrypoint.sh"]

RUN source /root/git-bash-helper.sh

CMD [ "node" ]