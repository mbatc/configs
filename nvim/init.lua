vim.opt.clipboard = "unnamedplus"
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

-- In init.lua
vim.opt.ignorecase = true  -- Ignore case when searching
vim.opt.smartcase = true   -- Switch to case-sensitive if you type an uppercase letter
vim.opt.hlsearch = true    -- Keep matches highlighted
vim.opt.incsearch = true   -- Show matches incrementally as you type

vim.opt.tabstop = 2      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2   -- Size of an indent (for >, <, etc.)
vim.opt.softtabstop = 2  -- Number of spaces a <Tab> counts for while editing
vim.opt.expandtab = true -- Convert tabs to spaces
