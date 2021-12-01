#!/bin/bash

###############################################
# 0.1 BASIC SETUP (please use absolute path)
###############################################
BASE_DIR_1="/Users/ongkc/workspace/playground/utilities-scripts/sample"
BASE_DIR_2="/Users/ongkc/workspace/playground/utilities-scripts/sample"
ARTIFACTS_DIR=$BASE_DIR_1"/to_deploy"
WORKSPACE_DIR_1=$BASE_DIR_2"/workspace1"
WORKSPACE_DIR_2=$BASE_DIR_2"/workspace2"
DEPLOY_DIR=$BASE_DIR_2"/deploy"
OVERRIDE_IF_EXISTS=true

echo "##############################################"
echo "Script Name: $0 | $# arguments"

if [ "$#" -eq "2" ]; then
        VERSION=$1
        WORKSPACE_FOLDER=$2

        ###############################################
        # 0.2 limitation: this file still required to be update manually
        ###############################################
        DEPLOY_LIST="$BASE_DIR_1/$WORKSPACE_FOLDER/$VERSION-to_deploy.list"

        echo "##############################################"
        echo "#1 - VERSION            : $VERSION"
        echo "#2 - WORKSPACE FOLDER   : $WORKSPACE_FOLDER"
        echo "##############################################"

        read -p "OK to proceed? (y,n) [y]" agree
        agree=${agree:-y}
        echo "Selected: $agree"

        if [ "$agree" =  "y" ]; then
                #clean workspace
                echo "##############################################"
                rm -rf "$BASE_DIR_1/$WORKSPACE_FOLDER/artifacts"
                rm -f "$BASE_DIR_1/$WORKSPACE_FOLDER/artifacts.list"
                rm -rf "$BASE_DIR_1/$WORKSPACE_FOLDER/to_deploy"

                #unzip artifacts
                echo "##############################################"
                unzip $BASE_DIR_1/$WORKSPACE_FOLDER/artifacts.zip -d $BASE_DIR_1/$WORKSPACE_FOLDER/artifacts

                #gather artifacts
                echo "##############################################"
                du -a $BASE_DIR_1/$WORKSPACE_FOLDER/artifacts | awk '{print $2}' | grep '[\.jar|\.war]$' > $BASE_DIR_1/$WORKSPACE_FOLDER/artifacts.list
                mkdir $BASE_DIR_1/$WORKSPACE_FOLDER/to_deploy
                for i in $(cat $BASE_DIR_1/$WORKSPACE_FOLDER/artifacts.list); do 
                    cp $i $BASE_DIR_1/$WORKSPACE_FOLDER/to_deploy/
                done

                echo "##############################################"
                ARTIFACTS_DIR=$BASE_DIR_1"/"$WORKSPACE_FOLDER"/to_deploy"
                RELEASE_VER=$VERSION
                RELEASE=$RELEASE_VER-$(date +%Y%m%d)
                SCRIPT_NAME=$BASE_DIR_1"/"$WORKSPACE_FOLDER"/deployment-$RELEASE.sh"
                ########################################
                # 1. generate lines from list
                ########################################
                if [ ${OVERRIDE_IF_EXISTS} = false ]; then
                    if [ -f "$SCRIPT_NAME" ]; then
                        echo "ERROR: $SCRIPT_NAME existed."
                        echo "ERROR: Abort script generation..."
                        exit 1;
                    else
                        echo "INFO: Generating: $SCRIPT_NAME"
                    fi
                else
                    echo "WARN: OVERRIDE_IF_EXISTS:true"
                    echo "WARN: Generating: $SCRIPT_NAME"
                fi

                echo "#!/bin/bash -x
                ###############################################
                # remove artifacts from workspace
                ###############################################

                echo 'start removing $RELEASE...'
                # ---- JARs ----
                cd $WORKSPACE_DIR_1" > $SCRIPT_NAME
                # first echo will replace by using ">"

                # subsequent echo will appending by using ">>"
                for i in $(cat $DEPLOY_LIST); do 
                    if [ ${i##*.} = "jar" ]; then
                        echo "rm -f $i" >> $SCRIPT_NAME
                    fi
                done

                echo "
                " >> $SCRIPT_NAME

                echo "# ---- WARs ---- 
                cd $WORKSPACE_DIR_2" >> $SCRIPT_NAME

                for i in $(cat $DEPLOY_LIST); do 
                    if [ ${i##*.} = "war" ]; then
                        echo "rm -f $i" >> $SCRIPT_NAME
                    fi
                done

                echo "echo 'end removing $RELEASE...';" >> $SCRIPT_NAME

                echo "

                ###############################################
                # deploying artifacts into deploy folder
                ###############################################

                cd $ARTIFACTS_DIR
                echo 'start deploying $RELEASE...';" >> $SCRIPT_NAME

                for i in $(cat $DEPLOY_LIST); do 
                    echo "cp $i $DEPLOY_DIR
                    sleep 1s;" >> $SCRIPT_NAME
                done

                echo "echo 'end deploying $RELEASE...';
                exit 0;" >> $SCRIPT_NAME

                echo "INFO: done generating $SCRIPT_NAME";
                echo "INFO: update script $SCRIPT_NAME permission";
                chmod u+x $SCRIPT_NAME;
                exit 0;
        else
                echo "[Abort] Not Proceed with generating script file : $SCRIPT_NAME"
        fi

else
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        echo "  Incorrect number of arguments. (2) "
        echo "  Expecting 2 : VERSION ARTIFACTS_LOCATION"
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        exit 2
fi