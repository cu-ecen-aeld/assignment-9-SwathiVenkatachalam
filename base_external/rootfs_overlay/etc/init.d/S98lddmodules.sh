#! /bin/sh

# Ref: Coursera Week 4 Linux System Initialization Video

case "$1" in
    start)
        echo "Starting module and scull"
        /usr/bin/module_load faulty
        /usr/bin/scull_load
        # Added for A8
        /usr/bin/aesdchar_load
        modprobe hello
        ;;
    stop)
        echo "Stopping module and scull"
        /usr/bin/module_unload
        /usr/bin/scull_unload
        # Added for A8
        /usr/bin/aesdchar_unload
        rmmod hello
        ;;
    *)
        echo "Usage: $0 {start|stop}"
    exit 1
esac

exit 0
