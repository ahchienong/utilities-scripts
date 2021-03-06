#!/bin/bash
 
#-------------------------------------------------------------------------------
# Wrapper script that can specify an ssh-key file with the Git command
#
# The MIT License (MIT) - http://opensource.org/licenses/MIT
# Copyright (c) 2013 Alvin Abad
#-------------------------------------------------------------------------------
 
if [ $# -eq 0 ]; then
    echo "Wrapper script that can specify an ssh-key file with the Git command
Usage:
    git.sh -i ssh-key-file git-command"
    exit 1
fi
 
# remove temporary file on exit
trap 'rm -f /tmp/.git_ssh.$$' 0
 
if [ "$1" = "-i" ]; then
    SSH_KEY=$2; shift; shift
    echo "ssh -i "$SSH_KEY" \"\$@\"" > /tmp/.git_ssh.$$
    chmod +x /tmp/.git_ssh.$$
    export GIT_SSH=/tmp/.git_ssh.$$
fi
 
# in case the git command is repeated
[ "$1" = "git" ] && shift
 
# Run the git command
git "$@"
    #echo "Git wrapper script that can specify an ssh-key file
#Usage:
#    git.sh -i ssh-key-file git-command
#    "
#    exit 1
    exit 0
fi
 
# remove temporary file on exit
trap 'rm -f /tmp/.git_ssh.$$' 0
 
if [ "$1" = "-i" ]; then
    SSH_KEY=$2; shift; shift
    echo "ssh -i $SSH_KEY \$@" > /tmp/.git_ssh.$$
    chmod +x /tmp/.git_ssh.$$
    export GIT_SSH=/tmp/.git_ssh.$$
fi
 
# in case the git command is repeated
[ "$1" = "git" ] && shift
# Run the git command
git "$@"
