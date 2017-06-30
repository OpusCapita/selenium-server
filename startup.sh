#!/bin/bash

echo Waiting for Selenium Server
/opt/bin/entry_point.sh 2>&1 > ./result/selenium_grid.log &
sleep 5
echo Starting WebDriver
npm start