#!/usr/bin/env bash
#
# generate-icons-inkscape.sh
#
# Script to generate favicons and related icons from an SVG using Inkscape.
# Ensures transparency in all PNG outputs.
# Requires Inkscape to be installed.

# The source SVG file (change if needed)
SVG="icon.svg"

if [[ ! -f "$SVG" ]]; then
  echo "Error: '$SVG' not found in current directory."
  exit 1
fi

echo "Generating icons from $SVG with transparency using Inkscape..."

# Check for Inkscape installation
if ! command -v inkscape &> /dev/null; then
  echo "Error: Inkscape is not installed or not in the PATH."
  exit 1
fi

# Function to convert SVG to PNG with transparency using Inkscape
convert_with_inkscape() {
  local input=$1
  local output=$2
  local size=$3
  
  echo " - $output (${size}x${size})"
  
  # Convert SVG to PNG using Inkscape
  # The --export-area-page option ensures the entire SVG is exported
  inkscape --export-filename="$output" \
           --export-width=$size \
           --export-height=$size \
           --export-background-opacity=0 \
           "$input"
}

#
# 1) PNG Favicons (common sizes)
#
for size in 16 32 48 64 128 256; do
  convert_with_inkscape "$SVG" "favicon-${size}x${size}.png" "$size"
done

#
# 2) Multi-resolution favicon.ico
# Note: We'll use ImageMagick just for combining the PNGs into an ICO file
# since Inkscape doesn't directly support ICO output
#
echo " - favicon.ico (multi-size)"
if command -v convert &> /dev/null; then
  convert favicon-16x16.png favicon-32x32.png favicon-48x48.png favicon.ico
else
  echo "   Warning: ImageMagick not found. Skipping favicon.ico creation."
fi

#
# 3) Apple Touch Icon (180x180 is common for iOS)
#
convert_with_inkscape "$SVG" "apple-touch-icon.png" "180"

#
# 4) Android Chrome Icons
#
convert_with_inkscape "$SVG" "android-chrome-192x192.png" "192"
convert_with_inkscape "$SVG" "android-chrome-512x512.png" "512"

#
# 5) Microsoft Tiles
#
convert_with_inkscape "$SVG" "mstile-70x70.png" "70"
convert_with_inkscape "$SVG" "mstile-144x144.png" "144"
convert_with_inkscape "$SVG" "mstile-150x150.png" "150"

# Special handling for non-square tiles
echo " - mstile-310x150.png"
inkscape --export-filename="mstile-310x150.png" \
         --export-width=310 \
         --export-height=150 \
         --export-background-opacity=0 \
         "$SVG"

convert_with_inkscape "$SVG" "mstile-310x310.png" "310"

#
# 6) Safari Pinned Tab (monochrome SVG)
#
echo " - safari-pinned-tab.svg"
cp "$SVG" "safari-pinned-tab.svg"

# Verify transparency in files (using identify from ImageMagick if available)
if command -v identify &> /dev/null; then
  echo "Verifying transparency in generated files..."
  for file in *.png; do
    if [[ -f "$file" ]]; then
      has_alpha=$(identify -format "%A" "$file")
      if [[ "$has_alpha" == "True" ]]; then
        echo " ✓ $file has transparency"
      else
        echo " ✗ $file lacks transparency"
      fi
    fi
  done
else
  echo "ImageMagick not found. Skipping transparency verification."
fi

echo "Done!"
