#!/bin/bash

# This is only meant to be used by me

set -euo pipefail

CONFIG=$(ls ~/sway_config)

for dir in $CONFIG
do
  if [[ "$dir" == "wallpapers" || "$dir" == "rofi-spotlight" ]]; then
    cp -r ~/$dir ./
  elif [[ "$dir" == "install.sh" || "$dir" == "update.sh" || "$dir" == "LICENSE" || "$dir" == "screenshot.png" || "$dir" == "README.md" ]]; then
    continue
  else
    echo "Update ${dir}"
    cp -r ~/.config/$dir ./
  fi
done


echo "Directory updated!"
echo ""

# Push to Github

git add ./

git commit -m update

git push
