#!/usr/bin/env bash

for branch in $(git branch -r | grep -v 'origin\/HEAD' | awk '{ print $1 }' | sed 's/origin\///g'); do                                          
    git checkout -B $branch origin/$branch                                                                                                        
    git pull origin $branch                                                                                                                       
done;

git remote add pdtl-origin ssh://***************************.git                                                                        
git push pdtl-origin                                                                                                                                                                                                                                                                       

echo 'Done'
