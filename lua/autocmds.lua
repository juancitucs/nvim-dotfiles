-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Disable line numbers, relative numbers, and spell checking in UI buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    "NvimTree",
    "lazy",
    "mason",
    "help",
    "FzfLua",  -- For fzf-lua buffers
    "qf",      -- Quickfix
  },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.spell = false
  end,
  group = vim.api.nvim_create_augroup('NoLineNumbersInUI', { clear = true }),
  desc = "Disable line numbers in UI buffers",
})

-- Relative number toggle is handled by nvim-numbertoggle plugin

-- Autocommand to refresh inline diagnostics on change

-- This is the main fix for the clangd issue, ensuring that whenever diagnostics

-- are updated (no matter how long the LSP takes), the inline diagnostics will be re-rendered.

vim.api.nvim_create_autocmd("DiagnosticChanged", {

	group = vim.api.nvim_create_augroup("RefreshInlineDiagnostics", { clear = true }),

	callback = function()

		-- We use a short timer to debounce the refresh, preventing it from firing too often.

		-- Instead of a plugin-specific function, we call the built-in Neovim function

		-- to show/refresh diagnostics for the current buffer. This triggers all diagnostic

		-- handlers, including tiny-inline-diagnostic.

		vim.fn.timer_start(50, function()

			vim.diagnostic.show(nil, vim.api.nvim_get_current_buf())

		end)

	end,

})
