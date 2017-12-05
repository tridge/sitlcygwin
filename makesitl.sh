#!/bin/sh

PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

EXTRAFLAGS = -DHAVE_CMATH_ISFINITE -DNEED_CMATH_ISFINITE_STD_NAMESPACE -DHAVE_CMATH_ISINF -DNEED_CMATH_ISINF_STD_NAMESPACE -DHAVE_CMATH_ISNAN -DNEED_CMATH_ISNAN_STD_NAMESPACE

cd /cygdrive/C/cygwin/home/media/ardupilot/

git pull &> /cygdrive/C/cygwin/home/media/sitl/git.txt
git submodule update --init --recursive -f &>> /cygdrive/C/cygwin/home/media/sitl/git.txt

cd APMrover2
make clean
make sitl -j8 -i &> /cygdrive/C/cygwin/home/media/sitl//APMrover2.txt
strip /tmp/APMrover2.build/APMrover2.elf
cp /tmp/APMrover2.build/APMrover2.elf /cygdrive/C/cygwin/home/media/sitl/
cd ..
# next
cd ArduCopter
make clean
make sitl -j8 -i &> /cygdrive/C/cygwin/home/media/sitl//ArduCopter.txt
strip /tmp/ArduCopter.build/ArduCopter.elf
cp /tmp/ArduCopter.build/ArduCopter.elf /cygdrive/C/cygwin/home/media/sitl/
make clean
make sitl-heli  -j8 -i &> /cygdrive/C/cygwin/home/media/sitl//Heli.txt
strip /tmp/ArduCopter.build/ArduCopter.elf
cp /tmp/ArduCopter.build/ArduCopter.elf /cygdrive/C/cygwin/home/media/sitl/ArduHeli.elf
cd ..
# next
cd ArduPlane
make clean
make sitl -j8 -i &> /cygdrive/C/cygwin/home/media/sitl//ArduPlane.txt
strip /tmp/ArduPlane.build/ArduPlane.elf
cp /tmp/ArduPlane.build/ArduPlane.elf /cygdrive/C/cygwin/home/media/sitl/
cd ..

cd /cygdrive/C/cygwin/home/media/sitl/
ls


