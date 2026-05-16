---------------------
---- PROGRAMS ----
---------------------
local M = {}
M.terminal = "ghostty"
M.fileManager = "nautilus"
M.menu = "rofi -show drun"
M.browser = "Brave"

-------------------
---- AUTOSTART ----
-------------------
M.exec_on_start = {
    clipboard_text = "wl-paste --type text  --watch cliphist store",
    clipboard_img = "wl-paste --type image --watch cliphist store",
    mon_script = "sh -c 'sleep 3 && hyprctl keyword monitor eDP-2,disable'",
    wallpaper_app = "hyprpaper",
    display_control = "kanshi",
    noti_daemon = "swaync",
    status_bar = "waybar",
}

return M
