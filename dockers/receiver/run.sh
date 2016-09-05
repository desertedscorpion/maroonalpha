#!/bin/sh

ssh-keygen -A &&
    ssh-keygen -f /root/.ssh/id_rsa -P "" &&
    cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys &&
    cat /root/.ssh/id_rsa &&
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