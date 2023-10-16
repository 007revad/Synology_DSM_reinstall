#!/usr/bin/env bash
#------------------------------------------------------------------------------
# Easily re-install the same DSM version without losing any data or settings
#
# Github: https://github.com/007revad/Synology_DSM_reinstall
# Script verified at https://www.shellcheck.net/
#
# Run this script to allow reinstalling the same DSM version
# You can run it via SSH with sudo,
#   or as root from task scheduler as a user defined script
#------------------------------------------------------------------------------

# Maybe we should backup the VERSION file here

# Prevent DSM auto-updating to "Update #" during reinstall
sed -i "s/\"smart_nano_enabled\":true/\"smart_nano_enabled\":false/g" "/usr/syno/etc/update.conf"

currentbuild=$(synogetkeyvalue /etc.defaults/VERSION buildnumber)
if [[ -n $currentbuild ]]; then
    echo "Current buildnumber is: $currentbuild"
else
    echo "Failed to get buildnumber!" && exit 1
fi

currentbase=$(synogetkeyvalue /etc.defaults/VERSION base)
if [[ -n $currentbase ]]; then
    echo "Current base is:        $currentbase"
    echo ""
else
    echo "Failed to get base!" && exit 1
fi

if [[ $currentbuild != "$currentbase" ]]; then
    echo "Current buildnumber and base are different!" && exit 1
fi


newbuild=$((currentbuild-1))
newbase=$((currentbase-1))
if [[ -z $newbuild ]] || [[ -z $newbase ]]; then
    echo "Failed to decrement buildnumber and/or base!" && exit 1
fi
if [[ $newbuild != "$newbase" ]]; then
    echo "New buildnumber and base are different!" && exit 1
fi


synosetkeyvalue /etc.defaults/VERSION buildnumber "$newbuild"
if [[ -z $synosetkeyvalue ]]; then
    echo "Changed buildnumber to: $newbuild"
else
    echo "Failed to edit buildnumber!" && exit 1
fi

synosetkeyvalue /etc.defaults/VERSION base "$newbase"
if [[ -z $synosetkeyvalue ]]; then
    echo "Changed base to:        $newbase"
else
    echo "Failed to edit base!" && exit 1
fi

echo -e "\nYou can now do a 'Manual Install' of the currently installed DSM version."

exit
