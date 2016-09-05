#!/bin/sh

apk upgrade &&
    apk update &&
    apk add openssh &&
    apk add rsync &&
    echo -e "Port 22\n" >> /etc/ssh/sshd_config &&
    echo -e "ListenAddress 0.0.0.0\n" >> /etc/ssh/sshd_config &&
    mkdir /root/.ssh &&
    chmod 0700 /root/.ssh &&
    touch /root/.ssh/authorized_keys &&
    chmod 0600 /root/.ssh/authorized_keys &&
    rm -rf /var/cache/apk/*