#!/usr/bin/env bash

# http://vaclavkosar.com/2018/02/25/Creating-Custom-Ubuntu-Web-Link-App.html

url="$1";
APPNAME=${1};
APPURL=${2};
APPID=${3};
APPPNG=${4};

mkdir -p "${HOME}/bin";

command="${HOME}/bin/${APPID}";
cat - > "${command}" <<END
#!/bin/sh -ue

#${1}
#${2}
#${3}
google-chrome --class "$APPNAME" -user-data-dir="$HOME/.config/webcatalog-$APPID" --app="$APPURL";
END
chmod u+x "$command";

desktopFile="$HOME/.local/share/applications/webcatalog-${APPID}.desktop";

icon="${HOME}/.local/share/icons/webcatalog-${APPID}.png"

cat - > "$desktopFile" <<END
[Desktop Entry]
Version=1.0
Type=Application
Name=$APPNAME
GenericName=$APPNAME
Icon=$icon
Exec=$command
Terminal=false
END

cp -v "${APPPNG}" "${icon}"