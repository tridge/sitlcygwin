#!/bin/sh

PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

cd /c/cygdrive/work/ardupilot/

git reset --hard origin/master
git clean -f
git checkout -f master 2>&1 | tee /c/cygdrive/work/sitl/git.txt
git pull 2>&1 | tee /c/cygdrive/work/sitl/git.txt
git submodule update --init --recursive -f 2>&1 | tee -a /c/cygdrive/work/sitl/git.txt

./waf configure | tee /c/cygdrive/work/sitl/configure.txt
./waf build | tee /c/cygdrive/work/sitl/build.txt

cp /c/cygdrive/work/ardupilot/build/sitl/bin/ /c/cygdrive/work/sitl/

cd /c/cygdrive/work/sitl/
ls


