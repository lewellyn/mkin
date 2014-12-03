#!/bin/sh

# This is untested with anything other than Terminal.app

osascript << EOF
tell application "Terminal"
	do script "/opt/lynx/bin/lynx '$@';exit"
	activate
end tell
EOF
exit