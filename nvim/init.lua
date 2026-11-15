
-- General Behaviour
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,noselect"
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

-- Telescope config

require('telescope').setup({
  defaults = {
      
  },
  pickers = {
    find_files = {
      follow = true,
      hidden = true,
    }
  }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Telescope commands' })
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'LSP: Goto Definition' })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'LSP: Goto References' })
vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = 'LSP: Goto Implementation' })
vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, { desc = 'LSP: Type Definition' })
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'LSP: Document Symbols' })
vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = 'LSP: Workspace Symbols' })
vim.keymap.set('n', '<leader>vd', builtin.diagnostics, { desc = 'LSP: View Diagnostics' })
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', {desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', {desc = 'Move line down' })
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', {desc = 'Move line down' })
vim.keymap.set('v', '<A-k>', ':m .+2<CR>==', {desc = 'Move line down' })

-- LSP Autocomplete

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
    end
  end,
});

-- clangd language server
vim.lsp.config.clangd = {
  cmd = {
    vim.fn.expand("$LLVM_BIN/clangd.exe"),
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu"
  },
  root_markers = {
    ".git",
    "compile_commands.json",
    ".clangd"
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
}

if not vim.lsp.is_enabled('clangd') then
  vim.lsp.enable('clangd')
end

vim.lsp.config["lua-language-server"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".git" },
}

if not vim.lsp.is_enabled('lua-language-server') then
  vim.lsp.enable('lua-language-server')
end

