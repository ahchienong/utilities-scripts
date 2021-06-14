#!/bin/bash

########################################
# 0. Configuration
LOCATION_TO_DEPLOY={LOCATION_TO_DEPLOY}
########################################

########################################
# 1. Copy artifact to deploy folder
########################################
cp -v ./to_deploy/* $LOCATION_TO_DEPLOY
