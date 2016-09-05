#!/bin/sh

ssh-keygen -A &&
    echo ${AUTHORIZED_KEY} > /root/.ssh/authorized_keys &&
    stop(){
        echo "Received SIGINT or SIGTERM. Shutting down sshd" &&
            pid=$(cat /var/run/sshd/sshd.pid) &&
            kill -SIGTERM "${pid}"
            wait "${pid}"
            echo "Done."
    } &&
    echo RUNNING ${@} &&
    if [ "$(basename $1)" == sshd ]
    then
        trap stop SIGINT SIGTERM
        $@ &
        pid="$!"
        mkdir -p /var/run/sshd && echo "${pid}" > /var/run/sshd/sshd.pid
        wait "${pid}" && exit $?
    else
        exec "$@"
    fi