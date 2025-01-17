#!/bin/sh

# Default ssh-host?
host="$1"
if [ -z "$1" ]; then
  host="rpizero-local-root"
fi

# sync
rsync -auHWv --no-perms --no-owner --no-group /home/connor/rpi/rootfs/ $host:/

# fix links
TARGET_ROOT=""

CMD=""
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/librt.so.1 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/librt.so;"
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libbz2.so.1.0 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libbz2.so;"
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libncurses.so.5.9 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libncurses.so.5;"
CMD="$CMD ln -sf $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libpython2.7.so.1.0 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libpython2.7.so;"

# fix links on rpi
ssh $host "$CMD"
