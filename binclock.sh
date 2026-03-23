#!/bin/sh

binclock_pid=""
binclock_bin="BinClock"

do_error() {
    echo "$0: $@" 1>&2
    exit 1
}

do_init() {
    [[ -z "$USER" ]] && do_error "cannot determine USER"
    binclock_pid=$(ps -u "${USER?}" | grep "${binclock_bin?}" | grep -v grep | awk '{print $2}')
}

do_start() {
    [[ -n "${binclock_pid?}" ]] && do_error "${binlock_bin?} already running as ${binclock_pid?}"
    nohup "${binclock_bin?}" > /dev/null &
}

do_stop() {
    [[ -z "${binclock_pid?}" ]] && do_error "${binclock_bin?} is not running"
    kill "${binclock_pid?}"
}

do_status() {
    if [[ -n "${binclock_pid?}" ]] ; then
        echo "${binclock_bin?} is running as PID ${binclock_pid?}"
    else
        echo "${binclock_bin?} is not running"
    fi
}

do_init
case "$1" in
    start)
        do_start
        ;;
    stop)
        do_stop
        ;;
    status)
        do_status
        ;;
    *)
        echo "Usage: $0 start|stop|status" 1>&2
        exit 1
esac
