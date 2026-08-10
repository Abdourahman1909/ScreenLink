#!/usr/bin/env bash

set -euo pipefail

app_image=$(find . -maxdepth 1 -type f -name 'Parallel-*.AppImage' -print -quit)

if [[ -z "${app_image}" ]]; then
  echo "No Parallel AppImage was found in this folder."
  echo "Download the AppImage beside this script and try again."
  exit 1
fi

bin_dir="${HOME}/.local/bin"
app_dir="${HOME}/.local/share/applications"
icon_dir="${HOME}/.local/share/icons/hicolor/512x512/apps"

mkdir -p "${bin_dir}" "${app_dir}" "${icon_dir}"
install -m 755 "${app_image}" "${bin_dir}/parallel"

if [[ -f icon.png ]]; then
  install -m 644 icon.png "${icon_dir}/parallel.png"
fi

desktop_file="${app_dir}/parallel.desktop"
printf '%s\n' \
  '[Desktop Entry]' \
  'Name=Parallel' \
  'Comment=Private screen collaboration over a local network' \
  "Exec=${bin_dir}/parallel" \
  'Icon=parallel' \
  'Terminal=false' \
  'Type=Application' \
  'Categories=Utility;Network;' \
  'Keywords=screen;share;collaboration;network;' \
  'StartupNotify=true' > "${desktop_file}"

if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "${app_dir}" >/dev/null 2>&1 || true
fi

echo "Parallel was installed for the current user."
echo "Open it from the application launcher or run: ${bin_dir}/parallel"

if ! command -v xdotool >/dev/null 2>&1; then
  echo "Note: X11 remote input requires xdotool (Ubuntu: sudo apt install xdotool)."
fi
