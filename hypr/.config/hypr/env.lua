-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("GDK_BACKEND", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("HYPRCURSOR_THEME", "Adwaita")
hl.env("NVD_BACKEND", "direct")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card0:/dev/dri/card1")
hl.env("WLR_DRM_NO_ATOMIC", "1")
