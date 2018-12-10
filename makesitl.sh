#!/bin/bash

export PATH="/usr/local/bin:/usr/bin:/bin:/cygdrive/c/cygwin32/bin:$PATH"

set -x

type -all g++
g++ -v || exit 1

cd /cygdrive/c/work/ardupilot/

git reset --hard origin/master
git clean -f
git checkout -f master 2>&1
git pull
git submodule update --init --recursive -f

ls -l /bin/g*
ls -l /usr/bin/g*

./waf configure --board sitl
cat build/config.log
./waf -j4 copter
./waf -j4 plane
./waf -j4 rover
./waf -j4 heli

cp /cygdrive/c/work/ardupilot/build/sitl/bin/ardurover.exe /cygdrive/c/work/sitl/APMrover2.elf
cp /cygdrive/c/work/ardupilot/build/sitl/bin/arduplane.exe /cygdrive/c/work/sitl/ArduPlane.elf
cp /cygdrive/c/work/ardupilot/build/sitl/bin/arducopter.exe /cygdrive/c/work/sitl/ArduCopter.elf
cp /cygdrive/c/work/ardupilot/build/sitl/bin/arducopter-heli.exe /cygdrive/c/work/sitl/ArduHeli.elf

cp /bin/cyggcc_s-1.dll /cygdrive/c/work/sitl/cyggcc_s-1.dll
cp /bin/cyggcc-1.dll /cygdrive/c/work/sitl/cyggcc-1.dll
cp /bin/cygstdc++-6.dll /cygdrive/c/work/sitl/cygstdc++-6.dll
cp /bin/cygwin1.dll /cygdrive/c/work/sitl/cygwin1.dll

cd /cygdrive/c/work/sitl/
ls


