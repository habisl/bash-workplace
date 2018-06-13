#!/bin/bash
#script to close not required branch in mercurial. 
# If the branch exists, it updates to the given branch or else exists with an error message.
# It closes the branch.
# Updates to the default branch.

hg up -C $1
if [ $? -eq 0 ]; then
    echo "$1 is up"
else
    echo "branch not found, please recheck your argument"
    exit 1
fi 
echo "$1 is up"
hg commit --close-branch -m 'this branch no longer required' 
echo "$1 is closed"
hg up -C default
echo "default is up" 
