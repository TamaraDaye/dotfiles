----------------------
---- WINDOW RULES ----
----------------------
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
	name = "float volume control",
	match = {
		class = "^(org.pulseaudio.pavucontrol)$",
	},
	float = true,
	size = "800 600",
})

hl.window_rule({
	name = "float blueman",
	match = {
		class = "^(org.pulseaudio.pavucontrol)$",
	},
	float = true,
	size = "800 600",
})

hl.window_rule({
	name = "float windscribe",
	match = { class = "^(Windscribe)" },
	float = true,
	size = "200 200",
	workspace = "5",
})

hl.window_rule({
	name = "float dialogs",
	match = { title = "^(Open|Save|Save As|Download|Select|Choose|File Upload).*" },
	float = true,
	size = "900 600",
})

hl.window_rule({
	name = "float xdg portal",
	match = { class = "^(xdg-desktop-portal-gtk)$" },
	float = true,
	size = "900 600",
})

hl.window_rule({
	name = "Send spotify to workspace 3",
	match = { class = "^(Spotify)$" },
	workspace = "3",
})

hl.window_rule({
	name = "Send discord to workspace 3",
	match = { class = "^(discord)$" },
	workspace = "3",
})

hl.window_rule({
	name = "Send brave to workspace 1",
	match = { class = "^(brave-browser)$" },
	workspace = "1",
})

hl.window_rule({
	name = "Send office to workspace 2",
	match = { class = "^(org.gnome.Evince|ONLYOFFICE)$" },
	workspace = "2",
})

hl.window_rule({
	name = "Send qbit to workspace 5",
	match = { class = "^(org.qbittorrent.qBittorrent)$" },
	workspace = "5",
})

hl.window_rule({
	name = "Send crunchyroll to workspace 4",
	match = { initial_title = "Crunchyroll" },
	workspace = "4",
})

hl.window_rule({
	name = "pip",
	match = { title = "^(Picture.in.Picture)$" },
	float = true,
	pin = true,
	size = "480 270",
	move = "monitor_w-490 10",
	opacity = "0.9 override",
})
hl.window_rule({
	match = { focus = false },
	dim_around = 1,
})

-- Blur behind waybar
hl.layer_rule({
	match = { namespace = "waybar" },
	blur = true,
	ignore_alpha = 0.3,
})

-- Blur behind rofi
hl.layer_rule({
	match = { namespace = "rofi" },
	blur = true,
	ignore_alpha = 0.3,
})

hl.layer_rule({
	match = { namespace = "selection" },
	no_anim = true,
})
