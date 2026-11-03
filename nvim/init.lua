
-- General Behaviour
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

-- Search options
vim.opt.ignorecase = true  -- Ignore case when searching
vim.opt.smartcase = true   -- Switch to case-sensitive if you type an uppercase letter
vim.opt.hlsearch = true    -- Keep matches highlighted
vim.opt.incsearch = true   -- Show matches incrementally as you type

-- Formatting
vim.opt.tabstop = 2      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2   -- Size of an indent (for >, <, etc.)
vim.opt.softtabstop = 2  -- Number of spaces a <Tab> counts for while editing
vim.opt.expandtab = true -- Convert tabs to spaces

-- Plugins
vim.pack.add({
  {
    src = "https://github.com/nvim-telescope/telescope.nvim",
    version = "v0.2.1"
  },
  {
    src = "https://github.com/nvim-lua/plenary.nvim",
    version = "v0.1.4"
  }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Telescope help tags' })
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'LSP: Goto Definition' })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'LSP: Goto References' })
vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = 'LSP: Goto Implementation' })
vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, { desc = 'LSP: Type Definition' })
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'LSP: Document Symbols' })
vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = 'LSP: Workspace Symbols' })
vim.keymap.set('n', '<leader>vd', builtin.diagnostics, { desc = 'LSP: View Diagnostics' })

