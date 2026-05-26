local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- Your UI Settings
config.enable_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Your Keybindings
config.keys = {
    -- Reload Config (Ctrl+Shift+R)
    { key = 'r', mods = 'CTRL|SHIFT', action = act.ReloadConfiguration },
    
    -- Copy (Ctrl+Shift+C)
    { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
    
    -- Paste (Ctrl+Shift+V)
    { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
}

return config
