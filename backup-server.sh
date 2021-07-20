#!/bin/sh
#
# Usage: Backup whole Application Server Directory
#

#Configuration
APP_HOME="/opt/liferay-dxp-7.2.10-dxp-13"
BACKUP_PATH="/root/backup"

tar -zcvf $BACKUP_PATH/liferay-$(date +%Y%m%d-%H%M%S).tar.gz $APP_HOME
