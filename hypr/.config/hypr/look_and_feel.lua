local M = {}

M.general = {
    gaps_in = 4,
    gaps_out = 5,
    border_size = 1,

    col = {
        active_border = { colors = { "rgba(7fc4a3ee)", "rgba(ffa759ee)" }, angle = 45 },
        inactive_border = "rgba(1e1e2eaa)",
    },

    layout = "scrolling",
    resize_on_border = true,
    allow_tearing = false,
}


M.decoration = {
    rounding = 5,
    screen_shader = "/home/jae/.config/hypr/shaders/vibrant.glsl",
    active_opacity = 1.0,
    inactive_opacity = 0.93,

    shadow = {
        enabled = false,
        range = 30,
        render_power = 4,
        color = "rgba(00000099)",
        offset = {0, 4},
    },

    blur = {
        enabled = true,
        size = 5,
        passes = 2,
        new_optimizations = true,
        ignore_opacity = false,
        vibrancy = 0.15,
        vibrancy_darkness = 0.4,
        special = true,
        popups = true,
		xray = false,
    },
}


M.animations = {enabled = true }


M.scrolling = {
    column_width = 0.5,
    direction = "right",
    focus_fit_method = 1,
    follow_focus = true,
    follow_min_visible = 0.4,
}

M.dwindle = {
    preserve_split = true,
    smart_split = true,
    force_split = 0,
    smart_resizing =true,
    special_scale_factor = 0.8,
    default_split_ratio = 1,
}

return M
