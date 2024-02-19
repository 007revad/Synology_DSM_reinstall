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

scriptver="v1.2.4"
script=Synology_DSM_reinstall
repo="007revad/Synology_DSM_reinstall"
scriptname=syno_reinstall_same_dsm_card

# Show script version
#echo -e "$script $scriptver\ngithub.com/$repo\n"
echo -e "$script $scriptver \n"

# Check script is running as root
if [[ $( whoami ) != "root" ]]; then
    echo "This script must be run as root or sudo."
    exit
fi

# Check script is running on a Synology NAS
if ! /usr/bin/uname -a | grep -i synology >/dev/null; then
    echo "This script is NOT running on a Synology NAS!"
    echo "Copy the script to a folder on the Synology"
    echo "and run it from there."
    exit 1
fi


# Maybe we should backup the VERSION file here

# Prevent DSM auto-updating to "Update #" during reinstall
##if grep '"smart_nano_enabled":true' "/usr/syno/etc/update.conf"; then
#   sed -i "s/\"smart_nano_enabled\":true/\"smart_nano_enabled\":false/g" "/usr/syno/etc/update.conf"
##fi


currentbuild=$(/usr/syno/bin/synogetkeyvalue /etc.defaults/VERSION buildnumber)
if [[ -n $currentbuild ]]; then
    echo "Current buildnumber is: $currentbuild"
else
    echo "Failed to get buildnumber!" && exit 1
fi

currentbase=$(/usr/syno/bin/synogetkeyvalue /etc.defaults/VERSION base)
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


/usr/syno/bin/synosetkeyvalue /etc.defaults/VERSION buildnumber "$newbuild"
value=$(/usr/syno/bin/synogetkeyvalue /etc.defaults/VERSION buildnumber)
if [[ $value == "$newbuild" ]]; then
    echo "Changed buildnumber to: $newbuild"
else
    echo "Failed to edit buildnumber!" && exit 1
fi

/usr/syno/bin/synosetkeyvalue /etc.defaults/VERSION base "$newbase"
value=$(/usr/syno/bin/synogetkeyvalue /etc.defaults/VERSION base)
if [[ $value == "$newbase" ]]; then
    echo "Changed base to:        $newbase"
else
    echo "Failed to edit base!" && exit 1
fi

echo -e "\nYou can now do a 'Manual Install' of the currently installed DSM version."

exit

