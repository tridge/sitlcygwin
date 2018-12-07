#!/bin/sh

PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

cd /work/ardupilot/

git reset --hard origin/master
git clean -f
git checkout -f master 2>&1 | tee /work/sitl/git.txt
git pull 2>&1 | tee /work/sitl/git.txt
git submodule update --init --recursive -f 2>&1 | tee -a /work/sitl/git.txt

./waf configure | tee /work/sitl/configure.txt
./waf build | tee /work/sitl/build.txt

cp /work/ardupilot/build/sitl/bin/ /work/sitl/

cd /work/sitl/
ls


