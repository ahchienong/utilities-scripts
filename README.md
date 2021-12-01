# utilities-scripts

## Usage

1. Download `gather-artifacts.sh` to server workspace.

    > `cd <DESIRE WORKSPACE>`

    > `wget https://raw.githubusercontent.com/ahchienong/utilities-scripts/main/gather-artifacts.sh`

    1.1 Executable
    
    > `chmod 711 gather-artifacts.sh`
    
    1.2 Run command to gather artifacts scripts

    > `./gather-artifacts.sh`

2. Download `generate-deployment-scripts` to server workspace.
- v1 usage:
    - placed in specific workspace, execute in specific workspace
    - configure scripts
    - `./generate-deployment-scripts.sh`
- v2 usage:
    - placed in specific workspace, execute in specific workspace
    - `./generate-deployment-scripts-v2.sh <VERSION> <FULL PATH to ARTIFACTS FOLDER>`
- v3 usage:
    - **placed one level above workspace, execute one level above workspace**
    - `generate-deployment-scripts-v3.sh <VERSION> <WORKSPACE FOLDER>`
----

_Assumptions & Tested on_

> Directory of scripts : `.`

> Directory to scan : `./artifacts`

> Directory to gather : `./to_deploy`

> Interested Artifact's Extension : `.jar & .war`

> Linux Distribution : `CentOS 7.x` , `CentOS 8.x`
