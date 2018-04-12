#!/bin/sh

PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

set EXTRAFLAGS = -DHAVE_CMATH_ISFINITE -DNEED_CMATH_ISFINITE_STD_NAMESPACE -DHAVE_CMATH_ISINF -DNEED_CMATH_ISINF_STD_NAMESPACE -DHAVE_CMATH_ISNAN -DNEED_CMATH_ISNAN_STD_NAMESPACE

cd /cygdrive/C/cygwin/home/media/ardupilot/

git pull 2>&1 | tee /cygdrive/C/cygwin/home/media/sitl/git.txt
git submodule update --init --recursive -f 2>&1 | tee -a /cygdrive/C/cygwin/home/media/sitl/git.txt

git checkout -f APMrover2-release
cd APMrover2
make clean
make sitl -j8 -i 2>&1 | tee /cygdrive/C/cygwin/home/media/sitl//APMrover2.txt
strip /tmp/APMrover2.build/APMrover2.elf
cp /tmp/APMrover2.build/APMrover2.elf /cygdrive/C/cygwin/home/media/sitl/
cd ..
# next
git checkout -f ArduCopter-stable
cd ArduCopter
make clean
make sitl -j8 -i 2>&1 | tee /cygdrive/C/cygwin/home/media/sitl//ArduCopter.txt
strip /tmp/ArduCopter.build/ArduCopter.elf
cp /tmp/ArduCopter.build/ArduCopter.elf /cygdrive/C/cygwin/home/media/sitl/
make clean
make sitl-heli  -j8 -i 2>&1 | tee /cygdrive/C/cygwin/home/media/sitl//Heli.txt
strip /tmp/ArduCopter.build/ArduCopter.elf
cp /tmp/ArduCopter.build/ArduCopter.elf /cygdrive/C/cygwin/home/media/sitl/ArduHeli.elf
cd ..
# next
git checkout -f ArduPlane-stable
cd ArduPlane
make clean
make sitl -j8 -i 2>&1 | tee /cygdrive/C/cygwin/home/media/sitl//ArduPlane.txt
strip /tmp/ArduPlane.build/ArduPlane.elf
cp /tmp/ArduPlane.build/ArduPlane.elf /cygdrive/C/cygwin/home/media/sitl/
cd ..

cd /cygdrive/C/cygwin/home/media/sitl/
ls


