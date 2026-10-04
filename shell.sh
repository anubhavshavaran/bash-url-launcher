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

urls=()

if [ -f "$l" ]; then
    while IFS= read -r url || [ -n "$url" ]; do
        url="${url%$'\r'}"
        [ -z "$url" ] && continue

        urls+=("$url")
    done < "$l"
else
    while IFS= read -r url; do
        urls+=("$url")
    done < <(printf '%s\n' "$l" | grep -oE 'https?://[^[:space:]]+')
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


if [ "${#urls[@]}" -eq 0 ]; then
    echo "Error: No links found."
    exit 1
fi

for url in "${urls[@]}"; do
    echo "Opening: $url"
done

"$browser_path" "${browser_args[@]}" "${urls[@]}"
