#!/bin/bash

###############################################
# 0. Pre-requisite
# ref: https://stedolan.github.io/jq/download/
###############################################
#sudo dnf install jq

###############################################
# 0. Configuration
# ref: https://help.sonatype.com/repomanager3/rest-and-integration-api/assets-api
###############################################
OSS_USER=
OSS_PASS=
OSS_BASE_URL=

OSS_ARTIFACT_REPO=
OSS_ARTIFACT_GROUP=
OSS_ARTIFACT_ID=
OSS_ARTIFACT_EXT=


###############################################
# 1. obtained latest artifacts
###############################################
curl -u $OSS_USER:$OSS_PASS -s GET "$OSS_BASE_URL/service/rest/v1/search/assets?sort=version&direction=desc&repository=$OSS_ARTIFACT_REPO&maven.groupId=$OSS_ARTIFACT_GROUP&maven.artifactId=$OSS_ARTIFACT_ID&maven.extension=$OSS_ARTIFACT_EXT" -H "accept: application/json" | jq -r '.items | .[0] | .downloadUrl?' > downloadUrl.list

###############################################
# 2. obtained latest artifacts url
###############################################
OSS_ARTIFACT_DL_URL=cat downloadUrl.list

###############################################
# 3. download latest artifacts
###############################################
wget --user=$OSS_USER --password='$OSS_PASS' $OSS_ARTIFACT_DL_URL

