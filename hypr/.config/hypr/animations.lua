-- Spring curves for that Apple-like bounce
hl.curve("snappy",  { type = "spring", mass = 1, stiffness = 170, dampening = 22 })
hl.curve("smooth",  { type = "spring", mass = 1, stiffness = 100, dampening = 18 })
hl.curve("poppy",   { type = "spring", mass = 1, stiffness = 200, dampening = 24 })
hl.curve("soft",    { type = "bezier", points = { {0.25, 1}, {0.5, 1} } })

hl.animation({ leaf = "windows",      enabled = true, speed = 4,  spring = "snappy",  style = "popin 80%" })
hl.animation({ leaf = "windowsIn",    enabled = true, speed = 4,  spring = "poppy",   style = "popin 85%" })
hl.animation({ leaf = "windowsOut",   enabled = true, speed = 3,  bezier = "soft",    style = "popin 80%" })
hl.animation({ leaf = "windowsMove",  enabled = true, speed = 4,  spring = "smooth" })
hl.animation({ leaf = "fade",         enabled = true, speed = 3,  bezier = "soft" })
hl.animation({ leaf = "border",       enabled = true, speed = 8,  spring = "smooth" })
hl.animation({ leaf = "workspaces",   enabled = true, speed = 5,  spring = "snappy",  style = "slidefadevert 15%" })
hl.animation({ leaf = "layers",       enabled = true, speed = 3,  spring = "poppy",   style = "popin 80%" })
