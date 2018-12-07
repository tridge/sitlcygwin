#!/bin/sh

PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

cd /cygdrive/c/work/ardupilot/

git reset --hard origin/master
git clean -f
git checkout -f master 2>&1 | tee /cygdrive/c/work/sitl/git.txt
git pull 2>&1 | tee /cygdrive/c/work/sitl/git.txt
git submodule update --init --recursive -f 2>&1 | tee -a /cygdrive/c/work/sitl/git.txt

./waf configure | tee /cygdrive/c/work/sitl/configure.txt
./waf build | tee /cygdrive/c/work/sitl/build.txt

cp /cygdrive/c/work/ardupilot/build/sitl/bin/ /cygdrive/c/work/sitl/

cd /cygdrive/c/work/sitl/
ls


