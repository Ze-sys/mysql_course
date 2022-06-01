#!/bin/bash
# to be put on crontab
d=$(date +"%Y-%b-%d:%H:%M:%S" --utc)
git add /workspace/z/* >> /workspace/z/commits_log.txt 2>&1
git commit -m "session as of  $d utc" >> /workspace/z/commits_log.txt 2>&1
git push >> /workspace/z/commits_log.txt 2>&1
