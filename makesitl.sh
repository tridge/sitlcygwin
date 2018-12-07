#!/bin/sh

PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

cd /cygdrive/C/cygwin/home/media/ardupilot/

git reset --hard origin/master
git clean -f
git checkout -f master 2>&1 | tee /cygdrive/C/cygwin/home/media/sitl/git.txt
git pull 2>&1 | tee /cygdrive/C/cygwin/home/media/sitl/git.txt
git submodule update --init --recursive -f 2>&1 | tee -a /cygdrive/C/cygwin/home/media/sitl/git.txt

./waf configure | tee /cygdrive/C/cygwin/home/media/sitl/configure.txt
./waf build | tee /cygdrive/C/cygwin/home/media/sitl/build.txt

cp /cygdrive/C/cygwin/home/media/ardupilot/build/sitl/bin/ /cygdrive/C/cygwin/home/media/sitl/

cd /cygdrive/C/cygwin/home/media/sitl/
ls


