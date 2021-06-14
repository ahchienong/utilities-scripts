#!/bin/bash

########################################
# 1. List down the artifacts into a list
########################################
du -a ./artifacts | awk '{print $2}' | grep '[\.jar|\.war]$' > artifacts.list

########################################
# 2. remove to_deploy folder (if exists)
########################################
rm -rf ./to_deploy
mkdir ./to_deploy

########################################
# 3. copy artifacts from list to folder
########################################
for i in $(cat ./artifacts.list); do 
    cp $i ./to_deploy/
done
