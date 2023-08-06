#!/bin/sh

files="bashrc bash_aliases vimrc gdbinit"
BAKDIR=$HOME/backup_config_files

for i in $files
do
  TMP=.${i}
  if [ -e $HOME/$TMP ]
  then
    if [ ! -d $BAKDIR ]
    then
      echo "Creating backup directory: $BAKDIR"
      mkdir $BAKDIR
    fi
    echo "Moving $HOME/$TMP to $BAKDIR/$i.bak"
    mv $HOME/$TMP $BAKDIR/$i.bak 
  fi
  echo "Installing files: $i"
  cp $i $HOME/$TMP
done
