#!/bin/bash

mkdir -p result
echo Waiting for Selenium Server
/opt/bin/entry_point.sh 2>&1 > ./result/selenium_grid.log &
sleep 5
echo Starting WebDriver
export NODE_PATH='$(NODE_PATH):/home/seluser/node_modules/'
./node_modules/.bin/wdio /test/wdio.conf.js $@