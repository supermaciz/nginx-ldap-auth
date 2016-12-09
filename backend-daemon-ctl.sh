#!/bin/sh

CMD=backend-sample-app.py

if [ ! -f "$CMD" ]; then
    echo "Please run '$0' from the same directory where '$CMD' file resides"
    exit 1
fi

# some versions of start-stop-daemon (i.e. ubuntu) require absolute path
CMD=$PWD/$CMD

PIDFILE=./backend-sample-app.pid

case $1 in
    "start")
        start-stop-daemon -S -x $CMD -b -m -p $PIDFILE
    ;;
    "stop")
        start-stop-daemon -K -p $PIDFILE
    ;;
    *)
        echo "Usage: $0 <start|stop>"
    ;;
esac
