#!/bin/sh

_fetch_sources(){
  wget -O /tmp/nanorc.zip https://github.com/scopatz/nanorc/archive/master.zip
  if [ ! -d ~/.nano/ ]
  then
    mkdir ~/.nano/
  fi

  cd ~/.nano/

  unzip -o "/tmp/nanorc.zip"
  mv nanorc-master/* ./
  rm -rf nanorc-master
  rm /tmp/nanorc.zip
}

_update_nanorc(){
  if [ ! -f ~/.nanorc ]
  then
      touch ~/.nanorc
  fi

  # add all includes from ~/.nano/nanorc if they're not already there
  while read inc; do
      if ! grep -q "$inc" "${NANORC_FILE}"; then
          echo "$inc" >> $NANORC_FILE
      fi
  done < ~/.nano/nanorc
}

_update_nanorc_lite(){
  sed -i '/include "\/usr\/share\/nano\/\*\.nanorc"/i include "~\/.nano\/*.nanorc"' "${NANORC_FILE}"
}

NANORC_FILE=~/.nanorc

case "$1" in
 -l|--lite)
 UPDATE_LITE=1;;
 -h|--help)
 echo "Install script for nanorc syntax highlights"
 echo "Call with -l or --lite to update .nanorc with secondary precedence to existing .nanorc includes"
 ;;
esac

_fetch_sources;
if [ $UPDATE_LITE ];
then
  _update_nanorc_lite
else
  _update_nanorc
fi
