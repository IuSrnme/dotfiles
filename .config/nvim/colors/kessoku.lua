-- ============================================================
-- kessoku.lua — sanny
-- ============================================================

vim.cmd("hi clear")
vim.o.background = "dark"
vim.g.colors_name = "kessoku"

-- --- Palette ---
local c = {
  bg       = "#000000",
  bg1      = "#1a1a1a",
  bg2      = "#2d2d2d",
  fg       = "#F7AABC",
  fg2      = "#E8D8CC",
  -- Primary (sampled)
  bocchi   = "#f59bb1",
  kita     = "#c75255",
  ryo      = "#516aa1",
  nijika   = "#e9d985",
  -- Secondary
  pink     = "#E87FA0",
  red      = "#E94B67",
  blue     = "#7EB8D4",
  yellow   = "#F0C060",
  -- Accents
  cyan     = "#90C8D8",
  comment  = "#4d4d4d",
}

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- --- Base ---
hi("Normal",        { fg = c.fg,      bg = c.bg })
hi("NormalFloat",   { fg = c.fg,      bg = c.bg1 })
hi("LineNr",        { fg = c.bg2 })
hi("CursorLineNr",  { fg = c.bocchi,  bold = true })
hi("CursorLine",    { bg = c.bg1 })
hi("Visual",        { bg = c.bg2 })
hi("Comment",       { fg = c.comment, italic = true })
hi("StatusLine",    { fg = c.fg,      bg = c.bg1 })
hi("VertSplit",     { fg = c.bg2 })
hi("WinSeparator",  { fg = c.bg2 })

-- --- Syntax ---
hi("Keyword",       { fg = c.bocchi,  bold = true })
hi("Function",      { fg = c.kita })
hi("String",        { fg = c.nijika })
hi("Number",        { fg = c.cyan })
hi("Boolean",       { fg = c.cyan })
hi("Type",          { fg = c.ryo })
hi("Constant",      { fg = c.fg2 })
hi("Identifier",    { fg = c.fg })
hi("Operator",      { fg = c.bocchi })
hi("PreProc",       { fg = c.ryo })
hi("Special",       { fg = c.cyan })

-- --- Completion/Popup ---
hi("Pmenu",         { fg = c.fg,      bg = c.bg1 })
hi("PmenuSel",      { fg = c.bg,      bg = c.bocchi })

-- --- Diagnostics ---
hi("DiagnosticError", { fg = c.kita })
hi("DiagnosticWarn",  { fg = c.nijika })
hi("DiagnosticInfo",  { fg = c.ryo })
hi("DiagnosticHint",  { fg = c.bocchi })
