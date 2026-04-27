vim.cmd("hi clear")
vim.o.background = "dark"
vim.g.colors_name = "kessoku"

local c = {
  bg       = "#000000",
  bg1      = "#1a1a1a",
  bg2      = "#2d2d2d",
  fg       = "#F7AABC",
  fg2      = "#E8D8CC",
  red      = "#E94B67",
  pink     = "#E87FA0",
  yellow   = "#F0C060",
  blue     = "#7EB8D4",
  cyan     = "#90C8D8",
  green    = "#89B4D4",
  comment  = "#4d4d4d",
}

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Base
hi("Normal",        { fg = c.fg,      bg = c.bg })
hi("NormalFloat",   { fg = c.fg,      bg = c.bg1 })
hi("LineNr",        { fg = c.bg2 })
hi("CursorLineNr",  { fg = c.pink,    bold = true })
hi("CursorLine",    { bg = c.bg1 })
hi("Visual",        { bg = c.bg2 })
hi("Comment",       { fg = c.comment, italic = true })
hi("StatusLine",    { fg = c.fg,      bg = c.bg1 })
hi("VertSplit",     { fg = c.bg2 })

-- Syntax
hi("Keyword",       { fg = c.pink,    bold = true })
hi("Function",      { fg = c.red })
hi("String",        { fg = c.yellow })
hi("Number",        { fg = c.cyan })
hi("Boolean",       { fg = c.cyan })
hi("Type",          { fg = c.blue })
hi("Constant",      { fg = c.fg2 })
hi("Identifier",    { fg = c.fg })
hi("Operator",      { fg = c.pink })
hi("PreProc",       { fg = c.blue })
hi("Special",       { fg = c.cyan })

-- Completion/Popup
hi("Pmenu",         { fg = c.fg,  bg = c.bg1 })
hi("PmenuSel",      { fg = c.bg,  bg = c.pink })
