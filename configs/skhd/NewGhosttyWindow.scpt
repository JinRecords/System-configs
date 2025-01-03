on is_running(appName)
        tell application "System Events" to (name of processes) contains appName
end is_running

if not is_running("ghostty") then
        tell application "Ghostty" to activate
else
        tell application "System Events" to tell process "ghostty"
                click menu item "New Window" of menu 1 of menu bar item "File" of menu bar 1
        end tell
end if
