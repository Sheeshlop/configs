#!/bin/bash

PROJECTS_DIR=~/angular
PROJECTS=`ls $PROJECTS_DIR`

openProject() {
  cd $PROJECTS_DIR/$1
}

PS3='Which project you want to open? '
select PROJECT in `ls $PROJECTS_DIR`
do
  PROJECTS_ARRAY=($PROJECTS)
  SELECTED_PROJECT=${PROJECTS_ARRAY[${REPLY:0:1}-1]} 
  openProject $SELECTED_PROJECT ${REPLY:1:1}
  break
done
