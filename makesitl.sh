#!/bin/bash

export PATH="/usr/local/bin:/usr/bin:/bin"
export PATH

set -x

type -all g++
g++ -v || exit 1

type python
python --version

cd /cygdrive/c/work/ardupilot/

git reset --hard origin/master
git clean -f
git checkout -f master 2>&1
git pull
git submodule update --init --recursive -f

ls -l /usr/bin/g++
/usr/bin/g++ -v || exit 1
echo | /usr/bin/g++ -dM -E -

/usr/bin/python --version

/usr/bin/python waf configure --board sitl
cat build/config.log
/usr/bin/python waf -j4 copter
/usr/bin/python waf -j4 plane
/usr/bin/python waf -j4 rover
/usr/bin/python waf -j4 heli

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


