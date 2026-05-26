require("env")
require("binds")
require("animations")
require("windows")
require("workspaces")

local programs = require("programs")
local general = require("look_and_feel")
local inputs = require("inputs")
local misc = require("misc")

local settings = { general, inputs, misc }

local function run_on_start()
	for _, app in pairs(programs.exec_on_start) do
		if type(app) == "string" then
			hl.exec_cmd(app)
		end
	end
end

hl.on("hyprland.start", run_on_start)

for _, setting in ipairs(settings) do
	hl.config(setting)
end
