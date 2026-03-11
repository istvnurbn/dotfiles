#!/bin/bash

# Most probably you don't have iMessage on other systems than macOS
if [[ "$OSTYPE" != darwin* ]];
then
    echo "This script expects a macOS system"
    exit 1
fi

# Checking dependencies

if ! command -v pv 2>&1 >/dev/null
then
    echo "pv could not be found"
    exit 1
fi

if ! command -v awk 2>&1 >/dev/null
then
    echo "awk could not be found"
    exit 1
fi

if ! command -v ffmpeg 2>&1 >/dev/null
then
    echo "ffmpeg could not be found"
    exit 1
fi

if ! command -v magick 2>&1 >/dev/null
then
    echo "ImageMagick could not be found"
    exit 1
fi

# Setting up the variables

TEMP_DIR=~/temp
BACKUP_DIR=/Volumes/LaCie/backup/iMessage

# Backing up iMessage

echo "Backing up..."
mkdir -p $TEMP_DIR/iMessage-"$(date +'%Y-%m-%d')"
imessage-exporter --format html --copy-method full --export-path $TEMP_DIR/iMessage-"$(date +'%Y-%m-%d')"

echo "Compressing..."
tar cf - -C $TEMP_DIR/iMessage-"$(date +'%Y-%m-%d')" . | pv -s $(($(du -sk $TEMP_DIR/iMessage-"$(date +'%Y-%m-%d')" | awk '{print $1}') * 1024)) | gzip > $BACKUP_DIR/iMessage-"$(date +'%Y-%m-%d')".tar.gz

echo "iMessage backup done!"

# Cleaning up

echo "Cleaning up..."
rm -rf $TEMP_DIR/iMessage-"$(date +'%Y-%m-%d')"

echo "Finished! ;)"
