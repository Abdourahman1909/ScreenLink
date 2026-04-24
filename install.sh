#!/bin/bash
# install.sh — Install ScreenLink as a system application
# Downloads and installs the latest ScreenLink AppImage

set -e

APP_NAME="screenlink"
BIN_DIR="$HOME/.local/bin"
ICON_DIR="$HOME/.local/share/icons"
APP_DIR="$HOME/.local/share/applications"

# Find the AppImage in current directory
APPIMAGE=$(ls -1 ScreenLink-*.AppImage 2>/dev/null | head -1)

if [ -z "$APPIMAGE" ]; then
  echo "❌ No AppImage found in current directory."
  echo "   Download ScreenLink-*.AppImage first, then run this script."
  exit 1
fi

echo "📦 Installing $APPIMAGE..."

mkdir -p "$BIN_DIR" "$ICON_DIR" "$APP_DIR"

# Copy AppImage
cp "$APPIMAGE" "$BIN_DIR/$APP_NAME"
chmod +x "$BIN_DIR/$APP_NAME"

# Extract icon from AppImage or use a default
# For now, create a simple icon placeholder
echo "🎨 Setting up app icon..."

# Create .desktop entry
cat > "$APP_DIR/$APP_NAME.desktop" << EOF
[Desktop Entry]
Name=ScreenLink
Comment=Share windows with nearby laptops over local WiFi
Exec=$BIN_DIR/$APP_NAME
Icon=$APP_NAME
Terminal=false
Type=Application
Categories=Utility;Network;
Keywords=screen;share;collaborate;window;
StartupNotify=true
EOF

# Update desktop database
update-desktop-database "$APP_DIR" 2>/dev/null || true

# Check dependencies
echo ""
echo "🔍 Checking dependencies..."
if command -v xdotool &>/dev/null; then
  echo "   ✅ xdotool found"
else
  echo "   ⚠️  xdotool not found — install with: sudo apt install xdotool"
fi
if command -v wmctrl &>/dev/null; then
  echo "   ✅ wmctrl found"
else
  echo "   ⚠️  wmctrl not found — install with: sudo apt install wmctrl"
fi

echo ""
echo "✅ ScreenLink installed!"
echo "   Search for 'ScreenLink' in your app launcher, or run: $APP_NAME"
