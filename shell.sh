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
    brave)
        browser_path="/mnt/c/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe"
        ;;
    *)
        echo "Unsupported browser: $b"
        exit 1
        ;;
esac

if [ ! -f "$browser_path" ]; then
    echo "Error: Browser is not installed."
    exit 1
fi

browser_args=()

if [ "$t" = "incognito" ]; then
    case "$b" in
        edge)
            browser_args+=(--inprivate)
            ;;
        chrome)
            browser_args+=(--incognito)
            ;;
        firefox)
            browser_args+=(-private-window)
            ;;
    esac
fi


read -ra urls <<< "$l"

"$browser_path" "${browser_args[@]}" "${urls[@]}"