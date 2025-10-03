#!/bin/bash
cd ~/my-project-git
git add bugs/ 2>/dev/null
if ! git diff --quiet --cached; then
    NOW=$(date +'%Y-%m-%d %H:%M')
    git commit -m "Sync: $NOW"
    git push origin master
fi
