#!/bin/sh

PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

cd /cygdrive/c/work/ardupilot/

git reset --hard origin/master
git clean -f
git checkout -f master 2>&1 | tee /cygdrive/c/work/sitl/git.txt
git pull 2>&1 | tee /cygdrive/c/work/sitl/git.txt
git submodule update --init --recursive -f 2>&1 | tee -a /cygdrive/c/work/sitl/git.txt

./waf configure | tee /cygdrive/c/work/sitl/configure.txt
./waf -j4 copter | tee /cygdrive/c/work/sitl/copter.txt
./waf -j4 plane | tee /cygdrive/c/work/sitl/plane.txt
./waf -j4 rover | tee /cygdrive/c/work/sitl/rover.txt
./waf -j4 heli | tee /cygdrive/c/work/sitl/heli.txt

cp /cygdrive/c/work/ardupilot/build/sitl/bin/ardurover.exe /cygdrive/c/work/sitl/APMrover2.elf
cp /cygdrive/c/work/ardupilot/build/sitl/bin/arduplane.exe /cygdrive/c/work/sitl/ArduPlane.elf
cp /cygdrive/c/work/ardupilot/build/sitl/bin/arducopter.exe /cygdrive/c/work/sitl/ArduCopter.elf
cp /cygdrive/c/work/ardupilot/build/sitl/bin/arducopter-heli.exe /cygdrive/c/work/sitl/ArduHeli.elf

cp /bin/cyggcc_s-1.dll /cygdrive/c/work/sitl/cyggcc_s-1.dll
cp /bin/cygstdc++-6.dll /cygdrive/c/work/sitl/cygstdc++-6.dll
cp /bin/cygwin1.dll /cygdrive/c/work/sitl/cygwin1.dll

cd /cygdrive/c/work/sitl/
ls


