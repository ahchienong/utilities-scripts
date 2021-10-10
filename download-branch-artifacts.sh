#!/bin/bash

########################################
# 0. Configuration
# Configure YOUR ACCESS TOKEN
# Configure YOUR PROJECT ARTIFACTS URL
# 
# Gitlab Personal Token: https://gitlab.com/-/profile/personal_access_tokens
# Gitlab API ref: https://docs.gitlab.com/ee/api/job_artifacts.html#download-the-artifacts-archive
########################################
BRANCH={BRANCH_INTERESTED}
JOB={JOB_INTERESTED}

YOUR_ACCESS_TOKEN={YOUR_ACCESS_TOKEN}
YOUR_PROJECT_ARTIFACTS_URL="https://gitlab.com/api/v4/projects/{PROJECT_ID}/jobs/artifacts/$BRANCH/download?job=$JOB"

########################################
# 1. Download the artifact
########################################
wget -O artifacts.zip --header="PRIVATE-TOKEN: $YOUR_ACCESS_TOKEN" $YOUR_PROJECT_ARTIFACTS_URL

########################################
# 2. remove artifacts folder (if exists)
########################################
rm -rf artifacts

########################################
# 3. Unzip the zip file
########################################
unzip artifacts.zip -d artifacts
