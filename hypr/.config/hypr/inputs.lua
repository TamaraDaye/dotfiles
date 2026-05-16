local M = {}
M.cursor = {
    no_hardware_cursors = 1,
    no_break_fs_vrr = 2,
    min_refresh_rate = 240,
	no_warps = false,
}


M.input = {
    kb_layout = "us",
    repeat_rate = 35,
    repeat_delay = 200,
	kb_options = "ctrl:nocaps",
    sensitivity = 0.0,
    accel_profile = "flat",
    force_no_accel = true,
    follow_mouse = 1,
    mouse_refocus = false,
    float_switch_override_focus = 1,

    touchpad = {
        natural_scroll = true,
        scroll_factor = 0.5,
        clickfinger_behavior = true,
        tap_to_click = true,
		disable_while_typing = true,
    },
}

return M
