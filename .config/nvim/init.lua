-- ============================================================
-- Neovim Config — sanny
-- ============================================================

-- --- Leader ---
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- --- Bootstrap lazy.nvim ---
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- --- Plugins ---
require("lazy").setup({

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "lua", "python", "javascript", "bash", "css", "html", "json" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = require("lspconfig")
      -- lsp.pyright.setup({})
      -- lsp.ts_ls.setup({})
    end
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = {
            normal   = { c = { fg = "#f59bb1", bg = "#1a1a1a" } },
            insert   = { c = { fg = "#e9d985", bg = "#1a1a1a" } },
            visual   = { c = { fg = "#516aa1", bg = "#1a1a1a" } },
            replace  = { c = { fg = "#c75255", bg = "#1a1a1a" } },
            inactive = { c = { fg = "#2d2d2d", bg = "#000000" } },
          },
          section_separators = "",
          component_separators = "│",
        },
        sections = {
          lualine_a = {},
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename" },
          lualine_x = { "diagnostics" },
          lualine_y = { "filetype" },
          lualine_z = { "location" },
        }
      })
    end
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          color_devicons = true,
        }
      })
      local tb = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", tb.find_files)
      vim.keymap.set("n", "<leader>fg", tb.live_grep)
      vim.keymap.set("n", "<leader>fb", tb.buffers)
    end
  },

})

-- --- Colorscheme ---
vim.cmd("colorscheme kessoku")

-- --- Settings ---
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.termguicolors  = true
vim.opt.scrolloff      = 8
vim.opt.wrap           = false
vim.opt.cursorline     = true

-- --- Keybinds ---
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
