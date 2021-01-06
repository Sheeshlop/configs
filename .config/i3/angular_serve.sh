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
  if test -f "$PROJECTS_DIR/$1/capacitor.config.json"; then
    echo -e "${COL_GREEN}Found capacitor config${COL_NC}"
    echo -e "- Performing ionic ${COL_GREEN}capacitor run android${COL_NC}"
    if [[ $2 ]]; then
      echo -e "${COL_PURPLE}You selected --prod(!) option, running in production...${COL_NC}"
      ionic capacitor run android -l --prod --external
    else
      echo -e "${COL_CYAN}--prod flag not specified, if you want to run your application in production, specify prod flag \"!\"${COL_NC}"
      ionic capacitor run android -l --external
    fi
  else
    if [[ $2 ]]; then
      echo -e "${COL_PURPLE}You selected --prod(!) option, running in production...${COL_NC}"
      ng serve --prod
    else
      echo -e "${COL_CYAN}--prod flag not specified, if you want to run your application in production, specify prod flag \"!\"${COL_NC}"
      ng serve
    fi
  fi
}

openEditor() {
# check for opened project in vscode
  EDITOR_OPENED_PROJECTS="$(code -s | grep "Folder")"
  if [[ $EDITOR_OPENED_PROJECTS == *"$1"* ]]; then
    echo -e "${COL_CYAN}-- project '$1' is currently opened in vscode, editor will not be opened${COL_NC}"
  else
    echo "$1 is not opened in VScode, opening project..."
    code -n "$PROJECTS_DIR/$1"
  fi
}

PS3='Which project you want to start? '
select PROJECT in $PROJECTS
do
  PROJECTS_ARRAY=($PROJECTS)
  SELECTED_PROJECT=${PROJECTS_ARRAY[${REPLY:0:1}-1]} 
  openEditor $SELECTED_PROJECT
# second argument stands for flag, i'll stick with "!", that means --prod flag (example, in prompt 1! or 2! or just 1)
  selectProject $SELECTED_PROJECT ${REPLY:1:1}
  break
done

# good explanations about:
# prompt
# https://stackoverflow.com/questions/1885525/how-do-i-prompt-a-user-for-confirmation-in-bash-script
# colors
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# text format
# https://askubuntu.com/questions/528928/how-to-do-underline-bold-italic-strikethrough-color-background-and-size-i
# check if string has a substring (check for project opened in vscode)
# https://stackoverflow.com/questions/229551/how-to-check-if-a-string-contains-a-substring-in-bash
