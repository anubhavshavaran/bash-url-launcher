#!/bin/bash

l="$1"
b="${2:-edge}"
t="${3:-normal}"

case "$b" in
    edge)
        browser_path="/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
        ;;
    chrome)
        browser_path="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
        ;;
    *)
        echo "Unsupported browser: $b"
        exit 1
        ;;
esac

read -ra urls <<< "$l"

"$browser_path" "${urls[@]}"

echo "Running with l=$l, b=$b, t=$t"