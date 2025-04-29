#!/bin/bash
# ========================================================
# WoW Addon Deployment Script
# ========================================================
# Description:
#   This script synchronizes the current directory with the
#   World of Warcraft addon folder. It's used for development
#   to quickly deploy addon updates to the game.
#
# When to run:
#   - After making changes to addon files that you want to test in-game
#   - During development to see immediate changes reflected in WoW
#
# Prerequisites:
#   - WoW client installed at the default location
#   - rsync command available
#
# Usage:
#   ./deploy_addon.sh
# ========================================================

WOW_ADDON_PATH="/Applications/World of Warcraft/_retail_/Interface/AddOns/PeaversTest"

CURRENT_DIR=$(pwd)

if [ ! -d "$WOW_ADDON_PATH" ]; then
    mkdir -p "$WOW_ADDON_PATH"
fi

rsync -avh --delete "$CURRENT_DIR/" "$WOW_ADDON_PATH/"

echo "Addon deployment complete!"
echo "Deployed to: $WOW_ADDON_PATH"
