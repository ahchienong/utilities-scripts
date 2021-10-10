#!/bin/bash -x
###############################################
# remove artifacts from workspace
###############################################

echo 'start removing v1.7.11-20211011...'
# ---- JARs ----
cd /Users/ongkc/workspace/playground/utilities-scripts/sample/workspace1
rm -f some-jar-file-1.jar
rm -f some-jar-file-2.jar
rm -f some-jar-file-prefix.*.jar


# ---- WARs ---- 
cd /Users/ongkc/workspace/playground/utilities-scripts/sample/workspace2
rm -f some-war-file-1.war
rm -f some-war-file-2.war
echo 'end removing v1.7.11-20211011...';


###############################################
# deploying artifacts into deploy folder
###############################################

cd /Users/ongkc/workspace/playground/utilities-scripts/sample/artifacts
echo 'start deploying v1.7.11-20211011...';
cp some-war-file-1.war /Users/ongkc/workspace/playground/utilities-scripts/sample/deploy
    sleep 1s;
cp some-war-file-2.war /Users/ongkc/workspace/playground/utilities-scripts/sample/deploy
    sleep 1s;
cp some-jar-file-1.jar /Users/ongkc/workspace/playground/utilities-scripts/sample/deploy
    sleep 1s;
cp some-jar-file-2.jar /Users/ongkc/workspace/playground/utilities-scripts/sample/deploy
    sleep 1s;
cp some-jar-file-prefix.*.jar /Users/ongkc/workspace/playground/utilities-scripts/sample/deploy
    sleep 1s;
echo 'end deploying v1.7.11-20211011...';
exit 0;
