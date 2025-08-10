#!/bin/bash

# === Configuration ===
THEMES_DIR="$HOME/.themes"
STATE_FILE="$THEMES_DIR/state.txt"
CONFIG_HELIX="$HOME/.config/helix/config.toml"
CONFIG_ALACRITTY="$HOME/.config/alacritty/alacritty.yml"

# === Helpers ===
get_current_theme() {
  [[ ! -f "$STATE_FILE" ]] && echo "gruvbox" > "$STATE_FILE"
  cat "$STATE_FILE"
}

set_current_theme() {
  echo "$1" > "$STATE_FILE"
}

get_all_themes() {
  find "$THEMES_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;
}

get_next_theme() {
  local themes=($(get_all_themes))
  local current=$(get_current_theme)
  for i in "${!themes[@]}"; do
    if [[ "${themes[$i]}" == "$current" ]]; then
      echo "${themes[$(( (i + 1) % ${#themes[@]} ))]}"
      return
    fi
  done
  echo "${themes[0]}"
}

# === Actions ===
apply_helix_theme() {
  local theme="$1"
  local helix_theme_file="$THEMES_DIR/$theme/helix.toml"
  [[ ! -f "$helix_theme_file" ]] && echo "Missing helix config for $theme" && return 1
  tail -n +2 "$CONFIG_HELIX" > /tmp/helix_rest.toml
  head -n 1 "$helix_theme_file" > "$CONFIG_HELIX"
  cat /tmp/helix_rest.toml >> "$CONFIG_HELIX"
  rm /tmp/helix_rest.toml
  echo "Helix theme applied: $theme"
}

apply_alacritty_theme() {
  local theme="$1"
  local src="$THEMES_DIR/$theme/alacritty.yml"
  [[ ! -f "$src" ]] && echo "Missing alacritty config for $theme" && return 1
  cp "$src" "$CONFIG_ALACRITTY"
  echo "Alacritty theme applied: $theme"
}

apply_wallpaper() {
  local theme="$1"
  local wallpaper="$THEMES_DIR/$theme/wallpaper.jpg"
  [[ ! -f "$wallpaper" ]] && echo "Missing wallpaper for $theme" && return 1
  feh --bg-scale "$wallpaper"
  echo "Wallpaper set: $wallpaper"
}

apply_theme() {
  local theme="$1"
  set_current_theme "$theme"
  apply_helix_theme "$theme"
  apply_alacritty_theme "$theme"
  apply_wallpaper "$theme"
}

toggle_theme() {
  local next=$(get_next_theme)
  apply_theme "$next"
}

# === Main ===
case "$1" in
  toggle) toggle_theme ;;
  apply) [[ -z "$2" ]] && echo "Specify a theme." && exit 1; apply_theme "$2" ;;
  list) get_all_themes ;;
  current) get_current_theme ;;
  *) apply_theme "$(get_current_theme)" ;;
esac
