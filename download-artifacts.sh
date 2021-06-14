#!/bin/bash

# Configure YOUR ACCESS TOKEN
# Configure YOUR PROJECT ARTIFACTS URL
YOUR_ACCESS_TOKEN={YOUR_ACCESS_TOKEN}
YOUR_PROJECT_ARTIFACTS_URL={YOUR_PROJECT_ARTIFACTS_URL}

## Download the artifact
#curl --output artifacts.zip --header "PRIVATE-TOKEN: $YOUR_ACCESS_TOKEN" $YOUR_PROJECT_ARTIFACTS_URL
wget -o artifacts.zip --header="PRIVATE-TOKEN: $YOUR_ACCESS_TOKEN" $YOUR_PROJECT_ARTIFACTS_URL

## Unzip the file
unzip artifacts.zip -d artifacts
