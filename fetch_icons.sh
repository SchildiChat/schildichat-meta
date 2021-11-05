#!/bin/bash

mydir="$(dirname "$(realpath "$0")")"

if [ -z "$SCHILDIDROID_PATH" ]; then
    SCHILDIDROID_PATH="$HOME/AndroidStudioProjects/SchildiChat-android"
fi
SCHILDIDROID_GRAPHICS="$SCHILDIDROID_PATH/graphics"
if [ -d "$SCHILDIDROID_GRAPHICS" ]; then
    rsync -av --del --exclude "*.sh" "$SCHILDIDROID_GRAPHICS/" "$mydir/graphics-android/"
else
    echo "Did not find SchildiChat-android, please set SCHILDIDROID_PATH properly"
fi

if [ -z "$SCHILDIDESKTOP_PATH" ]; then
    SCHILDIDESKTOP_PATH="$mydir/../schildichat-desktop/"
fi
SCHILDIDESKTOP_WEB_GRAPHICS="$SCHILDIDESKTOP_PATH/element-web/graphics"
SCHILDIDESKTOP_DESKTOP_GRAPHICS="$SCHILDIDESKTOP_PATH/element-desktop/graphics"
if [ -d "$SCHILDIDESKTOP_WEB_GRAPHICS" ] && [ -d "$SCHILDIDESKTOP_DESKTOP_GRAPHICS" ]; then
    rsync -av --del --exclude "*.sh" "$SCHILDIDESKTOP_WEB_GRAPHICS/" "$mydir/graphics-web/"
    rsync -av --del --exclude "*.sh" "$SCHILDIDESKTOP_DESKTOP_GRAPHICS/" "$mydir/graphics-desktop/"
else
    echo "Did not find schildichat-desktop, please set SCHILDIDESKTOP_PATH properly"
fi
