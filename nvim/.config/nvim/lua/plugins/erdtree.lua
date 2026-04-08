-- erdtree.lua - inspired by Shadow of the Erdtree
vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "erdtree"

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Palette
local gold        = "#E8A020"   -- Erdtree ring glow
local amber       = "#C97010"   -- deeper ember
local ember       = "#FF6A00"   -- hot edge glow
local teal        = "#4ECDC4"   -- mist highlights
local deep_teal   = "#2A8A84"   -- mid mist
local mist        = "#A8D8D4"   -- pale fog / strings
local fog         = "#6BAAA6"   -- dimmer fog / comments
local dark_mist   = "#1A3A38"   -- near-black teal bg (for floats)
local ghost       = "#D4EAE8"   -- almost-white foreground
local rune        = "#F0C060"   -- rune gold / constants
local blood       = "#C0392B"   -- error / danger
local ash         = "#7A8C8B"   -- line numbers, faded UI

-- Transparency (bg = "none" lets ghostty show through)
hi("Normal",          { fg = ghost,      bg = "none" })
hi("NormalNC",        { fg = ghost,      bg = "none" })
hi("NormalFloat",     { fg = ghost,      bg = dark_mist })
hi("EndOfBuffer",     { fg = ash,        bg = "none" })
hi("SignColumn",      { fg = ash,        bg = "none" })
hi("LineNr",          { fg = ash,        bg = "none" })
hi("CursorLineNr",    { fg = gold,       bg = "none", bold = true })
hi("CursorLine",      { bg = "#1C3432" })
hi("ColorColumn",     { bg = "#1C3432" })

-- Syntax
hi("Comment",         { fg = fog,        italic = true })
hi("Keyword",         { fg = gold,       bold = true })
hi("Conditional",     { fg = gold,       bold = true })
hi("Repeat",          { fg = gold,       bold = true })
hi("Statement",       { fg = amber })
hi("Function",        { fg = teal,       bold = true })
hi("Identifier",      { fg = mist })
hi("Variable",        { fg = ghost })
hi("Type",            { fg = deep_teal,  bold = true })
hi("StorageClass",    { fg = deep_teal })
hi("Structure",       { fg = deep_teal })
hi("Constant",        { fg = rune })
hi("Number",          { fg = ember })
hi("Float",           { fg = ember })
hi("Boolean",         { fg = ember })
hi("String",          { fg = mist })
hi("Character",       { fg = mist })
hi("Operator",        { fg = teal })
hi("Delimiter",       { fg = fog })
hi("Punctuation",     { fg = fog })
hi("PreProc",         { fg = amber })
hi("Include",         { fg = amber })
hi("Define",          { fg = amber })
hi("Special",         { fg = rune })
hi("SpecialChar",     { fg = ember })
hi("Tag",             { fg = teal })
hi("Error",           { fg = blood,      bold = true })
hi("Todo",            { fg = gold,       bold = true })
hi("Underlined",      { fg = teal,       underline = true })

-- Treesitter
hi("@variable",              { fg = ghost })
hi("@variable.builtin",      { fg = teal })
hi("@variable.parameter",    { fg = mist })
hi("@variable.member",       { fg = deep_teal })
hi("@function",              { fg = teal,    bold = true })
hi("@function.builtin",      { fg = ember })
hi("@function.call",         { fg = teal })
hi("@method",                { fg = teal })
hi("@keyword",               { fg = gold,    bold = true })
hi("@keyword.return",        { fg = ember,   bold = true })
hi("@keyword.function",      { fg = gold })
hi("@conditional",           { fg = gold })
hi("@repeat",                { fg = gold })
hi("@type",                  { fg = deep_teal, bold = true })
hi("@type.builtin",          { fg = deep_teal })
hi("@constant",              { fg = rune })
hi("@constant.builtin",      { fg = ember })
hi("@string",                { fg = mist })
hi("@number",                { fg = ember })
hi("@boolean",               { fg = ember })
hi("@operator",              { fg = teal })
hi("@punctuation.delimiter", { fg = fog })
hi("@punctuation.bracket",   { fg = fog })
hi("@comment",               { fg = fog,     italic = true })
hi("@tag",                   { fg = gold })
hi("@tag.attribute",         { fg = teal })
hi("@tag.delimiter",         { fg = fog })

-- UI
hi("StatusLine",      { fg = ghost,    bg = dark_mist })
hi("StatusLineNC",    { fg = ash,      bg = dark_mist })
hi("WinBar",          { fg = teal,     bg = "none" })
hi("TabLine",         { fg = ash,      bg = dark_mist })
hi("TabLineSel",      { fg = gold,     bg = "none", bold = true })
hi("TabLineFill",     { bg = dark_mist })
hi("Pmenu",           { fg = ghost,    bg = dark_mist })
hi("PmenuSel",        { fg = gold,     bg = "#1F4A47", bold = true })
hi("PmenuSbar",       { bg = dark_mist })
hi("PmenuThumb",      { bg = deep_teal })
hi("Visual",          { bg = "#2A4A47" })
hi("Search",          { fg = "#000000", bg = gold })
hi("IncSearch",       { fg = "#000000", bg = ember })
hi("MatchParen",      { fg = ember,    bold = true, underline = true })
hi("Directory",       { fg = teal })
hi("Title",           { fg = gold,     bold = true })
hi("WinSeparator",    { fg = deep_teal, bg = "none" })
hi("VertSplit",       { fg = deep_teal, bg = "none" })
hi("FoldColumn",      { fg = fog,      bg = "none" })
hi("Folded",          { fg = fog,      bg = "#1C3432" })
hi("NonText",         { fg = ash })
hi("SpecialKey",      { fg = ash })

-- Diagnostics
hi("DiagnosticError",       { fg = blood })
hi("DiagnosticWarn",        { fg = gold })
hi("DiagnosticInfo",        { fg = teal })
hi("DiagnosticHint",        { fg = deep_teal })
hi("DiagnosticUnderlineError", { undercurl = true, sp = blood })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = gold })

-- Git (gitsigns etc)
hi("DiffAdd",         { fg = teal,   bg = "none" })
hi("DiffChange",      { fg = gold,   bg = "none" })
hi("DiffDelete",      { fg = blood,  bg = "none" })
hi("DiffText",        { fg = ember,  bg = "none" })
