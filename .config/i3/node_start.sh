#!/bin/bash

COL_RED='\033[0;31m'
COL_GREEN='\033[0;32m'
COL_PURPLE='\033[0;35m'
COL_CYAN='\033[0;36m'
COL_NC='\033[0m'

# Define your folder with projects you want to run, change
PROJECTS_DIR=~/node

PROJECTS=`ls $PROJECTS_DIR`

selectProject() {
  cd $PROJECTS_DIR/$1
  nodemon index.js
}

openEditor() {
  echo -e "${COL_GREEN} Opening \e[1m$1\e[0m ${COL_GREEN}in vscode editor ...${COL_NC}"
  code -n "$PROJECTS_DIR/$1"
}

PS3='Which nodejs project you want to start? '
select PROJECT in $PROJECTS
do
  read -p "Open $project in vscode? (Y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    openEditor $PROJECT
  fi
  selectProject $PROJECT
  break
done
