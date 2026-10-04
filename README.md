# Bash URL Launcher

Open one or more URLs with Microsoft Edge, Google Chrome, or Brave from WSL.

## Usage

```bash
./shell.sh <url-or-file> [browser] [mode]
```

Arguments:

- `<url-or-file>`: A string containing one or more `http://` or `https://` links, or a file containing one URL per line.
- `[browser]`: `edge` (default), `chrome`, or `brave`.
- `[mode]`: `normal` (default) or `incognito`.

## Examples

Open a URL with the default browser:

```bash
./shell.sh "https://example.com"
```

Open a URL with Chrome in incognito mode:

```bash
./shell.sh "https://example.com" chrome incognito
```

Open every non-empty line in a file:

```bash
./shell.sh links.txt edge
```

The script expects browsers to be installed at their standard Windows paths mounted under `/mnt/c`:

- Edge: `C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe`
- Chrome: `C:\Program Files\Google\Chrome\Application\chrome.exe`
- Brave: `C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe`
