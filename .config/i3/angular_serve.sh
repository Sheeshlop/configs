#!/bin/bash

COL_RED='\033[0;31m'
COL_GREEN='\033[0;32m'
COL_PURPLE='\033[0;35m'
COL_CYAN='\033[0;36m'
COL_NC='\033[0m'

# Define your folder with projects you want to run, change
PROJECTS_DIR=~/angular

PROJECTS=`ls $PROJECTS_DIR`

selectProject() {
  cd $PROJECTS_DIR/$1
# here you can do something with your project, for example: 
# node index.js
# npm run start
# or anything you like to do when in terminal with your opened project

# I run condition
  read -p "Is it ionic project (Y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo -e "-- Performing 'ionic cap run android -l --external --prod'"
    ionic cap run android -l --external --prod
  fi
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo -e "-- Performing 'ng serve'"
    ng serve
  fi
}

openEditor() {
  echo -e "${COL_GREEN} Opening \e[1m$1\e[0m ${COL_GREEN}in vscode editor ...${COL_NC}"
  code -a -n $PROJECTS_DIR/$1
}

PS3='Which project you want to start? '
select PROJerve -oCT in $PROJECTS
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

# good explanations about:
# prompt
# https://stackoverflow.com/questions/1885525/how-do-i-prompt-a-user-for-confirmation-in-bash-script
# colors
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# text format
# https://askubuntu.com/questions/528928/how-to-do-underline-bold-italic-strikethrough-color-background-and-size-i
