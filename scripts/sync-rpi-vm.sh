#!/bin/sh

# Default ssh-host?
host="$1"
if [ -z "$1" ]; then
  host="rpizero-local-root"
fi

# sync
rsync -auHWv $host:{/usr,/lib} ~/rpi/rootfs

# fix links
TARGET_ROOT="/home/connor/rpi/rootfs"

CMD=""
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/librt.so.1 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/librt.so;"
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libdl.so.2 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libdl.so;"

CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libbz2.so.1.0 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libbz2.so;"
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libncurses.so.5.9 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libncurses.so.5;"
CMD="$CMD ln -sf $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libpython2.7.so.1.0 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libpython2.7.so;"

# fix pthread
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libpthread-2.28.so $TARGET_ROOT/lib/arm-linux-gnueabihf/libpthread.so.0;"
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libpthread.so.0 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libpthread.so;"

# fix libresolv
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libresolv-2.28.so $TARGET_ROOT/lib/arm-linux-gnueabihf/libresolv.so.2;"
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libresolv.so.2 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libresolv.so;"

CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libgcc_s.so.1 $TARGET_ROOT/usr/lib/gcc/arm-linux-gnueabihf/8/libgcc_s.so.1;"
CMD="$CMD ln -sf $TARGET_ROOT/lib/ld-linux-armhf.so.3 $TARGET_ROOT/lib/ld-linux.so.3;"

CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libz.so.1.2.11 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libz.so;"
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libm.so.6 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libm.so;"
CMD="$CMD ln -sf $TARGET_ROOT/lib/arm-linux-gnueabihf/libusb-1.0.so.0.1.0 $TARGET_ROOT/usr/lib/arm-linux-gnueabihf/libusb-1.0.so;"


# ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libc-2.28.so /home/connor/rpi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/../arm-linux-gnueabihf/sysroot/lib/libc.so.6
# ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/ld-2.28.so /home/connor/rpi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/../arm-linux-gnueabihf/sysroot/lib/ld-linux-armhf.so.3
# ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libstdc++.so.6.0.25 /home/connor/rpi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/../arm-linux-gnueabihf/sysroot/lib/libstdc++.so.6
# ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libstdc++.so.6.0.25 /home/connor/rpi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/../arm-linux-gnueabihf/sysroot/lib/libstdc++.so
# ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libpthread-2.28.so /home/connor/rpi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/../arm-linux-gnueabihf/sysroot/lib/libpthread.so.0
# ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libm.so.6 /home/connor/rpi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/../arm-linux-gnueabihf/sysroot/lib/libm.so.6






# cp /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/crt1.o /home/connor/rpi/rootfs/usr/lib/crt1.o
# cp /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/crti.o /home/connor/rpi/rootfs/usr/lib/crti.o

# cp /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libm.so /home/connor/rpi/rootfs/usr/lib/libm.so
# cp /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libc.so /home/connor/rpi/rootfs/usr/lib/libc.so
# ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libc.a /home/connor/rpi/rootfs/usr/lib/libc.a

# ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libpthread.a /home/connor/rpi/rootfs/usr/lib/libpthread.a
# cp /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libc_nonshared.a /home/connor/rpi/rootfs/usr/lib/libc_nonshared.a

# ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/crtn.o /home/connor/rpi/rootfs/usr/lib/crtn.o


# TODO: Find a way to enumerate the libraries in the raspberry/tools cross compiler and link just like them in rootfs

ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/crtn.o /home/connor/rpi/rootfs/usr/lib/crtn.o
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/gcrt1.o /home/connor/rpi/rootfs/usr/lib/gcrt1.o
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libanl.a /home/connor/rpi/rootfs/usr/lib/libanl.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libanl.so /home/connor/rpi/rootfs/usr/lib/libanl.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libBrokenLocale.a /home/connor/rpi/rootfs/usr/lib/libBrokenLocale.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libBrokenLocale.so /home/connor/rpi/rootfs/usr/lib/libBrokenLocale.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libc.a /home/connor/rpi/rootfs/usr/lib/libc.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libcidn.so /home/connor/rpi/rootfs/usr/lib/libcidn.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libc_nonshared.a /home/connor/rpi/rootfs/usr/lib/libc_nonshared.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libcrypt.a /home/connor/rpi/rootfs/usr/lib/libcrypt.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libcrypt.so /home/connor/rpi/rootfs/usr/lib/libcrypt.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libc.so /home/connor/rpi/rootfs/usr/lib/libc.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libdl.a /home/connor/rpi/rootfs/usr/lib/libdl.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libdl.so /home/connor/rpi/rootfs/usr/lib/libdl.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libg.a /home/connor/rpi/rootfs/usr/lib/libg.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libieee.a /home/connor/rpi/rootfs/usr/lib/libieee.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libm.a /home/connor/rpi/rootfs/usr/lib/libm.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libmcheck.a /home/connor/rpi/rootfs/usr/lib/libmcheck.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libm.so /home/connor/rpi/rootfs/usr/lib/libm.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libnsl.a /home/connor/rpi/rootfs/usr/lib/libnsl.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libnsl.so /home/connor/rpi/rootfs/usr/lib/libnsl.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libnss_compat.so /home/connor/rpi/rootfs/usr/lib/libnss_compat.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libnss_db.so /home/connor/rpi/rootfs/usr/lib/libnss_db.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libnss_dns.so /home/connor/rpi/rootfs/usr/lib/libnss_dns.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libnss_files.so /home/connor/rpi/rootfs/usr/lib/libnss_files.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libnss_hesiod.so /home/connor/rpi/rootfs/usr/lib/libnss_hesiod.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libnss_nisplus.so /home/connor/rpi/rootfs/usr/lib/libnss_nisplus.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libnss_nis.so /home/connor/rpi/rootfs/usr/lib/libnss_nis.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libpthread.a /home/connor/rpi/rootfs/usr/lib/libpthread.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libpthread_nonshared.a /home/connor/rpi/rootfs/usr/lib/libpthread_nonshared.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libpthread.so /home/connor/rpi/rootfs/usr/lib/libpthread.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libresolv.a /home/connor/rpi/rootfs/usr/lib/libresolv.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libresolv.so /home/connor/rpi/rootfs/usr/lib/libresolv.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/librpcsvc.a /home/connor/rpi/rootfs/usr/lib/librpcsvc.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/librt.a /home/connor/rpi/rootfs/usr/lib/librt.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/librt.so /home/connor/rpi/rootfs/usr/lib/librt.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libthread_db.so /home/connor/rpi/rootfs/usr/lib/libthread_db.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libutil.a /home/connor/rpi/rootfs/usr/lib/libutil.a
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/libutil.so /home/connor/rpi/rootfs/usr/lib/libutil.so
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/Mcrt1.o /home/connor/rpi/rootfs/usr/lib/Mcrt1.o
ln -sf /home/connor/rpi/rootfs/usr/lib/arm-linux-gnueabihf/Scrt1.o /home/connor/rpi/rootfs/usr/lib/Scrt1.o

ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/ld-2.28.so /home/connor/rpi/rootfs/lib/ld-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/ld-linux-armhf.so.3 /home/connor/rpi/rootfs/lib/arm-linuxarmhf.so.3
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/ldscripts /home/connor/rpi/rootfs/lib/ldscripts
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libanl-2.28.so /home/connor/rpi/rootfs/lib/arm-nl-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libanl.so.1 /home/connor/rpi/rootfs/lib/aibanl.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libatomic.a /home/connor/rpi/rootfs/lib/aibatomic.a
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libatomic.so /home/connor/rpi/rootfs/lib/arbatomic.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libatomic.so.1 /home/connor/rpi/rootfs/lib/arm-tomic.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libatomic.so.1.1.0 /home/connor/rpi/rootfs/lib/arm-linuc.so.1.1.0
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libBrokenLocale-2.28.so /home/connor/rpi/rootfs/lib/arm-linux-gnule-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libBrokenLocale.so.1 /home/connor/rpi/rootfs/lib/arm-linux-ocale.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libc-2.28.so /home/connor/rpi/rootfs/lib/arbc-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libcidn-2.28.so /home/connor/rpi/rootfs/lib/arm-ldn-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libcidn.so.1 /home/connor/rpi/rootfs/lib/arbcidn.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libcrypt-2.28.so /home/connor/rpi/rootfs/lib/arm-lipt-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libcrypt.so.1 /home/connor/rpi/rootfs/lib/armcrypt.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libc.so.6 /home/connor/rpi/rootfs/lib/libc.so.6
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libdl-2.28.so /home/connor/rpi/rootfs/lib/armdl-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libdl.so.2 /home/connor/rpi/rootfs/lib/libdl.so.2
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libgcc_s.so /home/connor/rpi/rootfs/lib/aibgcc_s.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libgcc_s.so.1 /home/connor/rpi/rootfs/lib/armgcc_s.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libgomp.a /home/connor/rpi/rootfs/lib/libgomp.a
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libgomp.so /home/connor/rpi/rootfs/lib/libgomp.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libgomp.so.1 /home/connor/rpi/rootfs/lib/arbgomp.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libgomp.so.1.0.0 /home/connor/rpi/rootfs/lib/arm-lip.so.1.0.0
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libgomp.spec /home/connor/rpi/rootfs/lib/arbgomp.spec
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libitm.a /home/connor/rpi/rootfs/lib/libitm.a
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libitm.so /home/connor/rpi/rootfs/lib/libitm.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libitm.so.1 /home/connor/rpi/rootfs/lib/aibitm.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libitm.so.1.0.0 /home/connor/rpi/rootfs/lib/arm-lm.so.1.0.0
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libitm.spec /home/connor/rpi/rootfs/lib/aibitm.spec
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libm-2.28.so /home/connor/rpi/rootfs/lib/arbm-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libmemusage.so /home/connor/rpi/rootfs/lib/arm-emusage.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libm.so.6 /home/connor/rpi/rootfs/lib/libm.so.6
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnsl-2.28.so /home/connor/rpi/rootfs/lib/arm-sl-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnsl.so.1 /home/connor/rpi/rootfs/lib/aibnsl.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_compat-2.28.so /home/connor/rpi/rootfs/lib/arm-linux-gat-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_compat.so.2 /home/connor/rpi/rootfs/lib/arm-linuompat.so.2
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_db-2.28.so /home/connor/rpi/rootfs/lib/arm-lindb-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_db.so.2 /home/connor/rpi/rootfs/lib/arm-ss_db.so.2
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_dns-2.28.so /home/connor/rpi/rootfs/lib/arm-linuns-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_dns.so.2 /home/connor/rpi/rootfs/lib/arm-ls_dns.so.2
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_files-2.28.so /home/connor/rpi/rootfs/lib/arm-linux-es-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_files.so.2 /home/connor/rpi/rootfs/lib/arm-linfiles.so.2
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_hesiod-2.28.so /home/connor/rpi/rootfs/lib/arm-linux-god-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_hesiod.so.2 /home/connor/rpi/rootfs/lib/arm-linuesiod.so.2
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_nis-2.28.so /home/connor/rpi/rootfs/lib/arm-linuis-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_nisplus-2.28.so /home/connor/rpi/rootfs/lib/arm-linux-gnus-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_nisplus.so.2 /home/connor/rpi/rootfs/lib/arm-linuxsplus.so.2
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libnss_nis.so.2 /home/connor/rpi/rootfs/lib/arm-ls_nis.so.2
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libpcprofile.so /home/connor/rpi/rootfs/lib/arm-lprofile.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libpthread-2.28.so /home/connor/rpi/rootfs/lib/arm-linuad-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libpthread.so.0 /home/connor/rpi/rootfs/lib/arm-lhread.so.0
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libresolv-2.28.so /home/connor/rpi/rootfs/lib/arm-linlv-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libresolv.so.2 /home/connor/rpi/rootfs/lib/arm-esolv.so.2
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/librt-2.28.so /home/connor/rpi/rootfs/lib/armrt-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/librt.so.1 /home/connor/rpi/rootfs/lib/librt.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libSegFault.so /home/connor/rpi/rootfs/lib/arm-egFault.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libstdc++.a /home/connor/rpi/rootfs/lib/aibstdc++.a
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libstdc++.so /home/connor/rpi/rootfs/lib/arbstdc++.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libstdc++.so.6 /home/connor/rpi/rootfs/lib/arm-tdc++.so.6
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libstdc++.so.6.0.20 /home/connor/rpi/rootfs/lib/arm-linux.so.6.0.20
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libstdc++.so.6.0.20-gdb.py /home/connor/rpi/rootfs/lib/arm-linux-gnueab.20-gdb.py
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libsupc++.a /home/connor/rpi/rootfs/lib/aibsupc++.a
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libthread_db-1.0.so /home/connor/rpi/rootfs/lib/arm-linux_db-1.0.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libthread_db.so.1 /home/connor/rpi/rootfs/lib/arm-linad_db.so.1
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libutil-2.28.so /home/connor/rpi/rootfs/lib/arm-lil-2.28.so
ln -sf /home/connor/rpi/rootfs/lib/arm-linux-gnueabihf/libutil.so.1 /home/connor/rpi/rootfs/lib/arbutil.so.1

# fix links in vm
eval $CMD
