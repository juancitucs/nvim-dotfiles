-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local map = vim.keymap.set
-- Picker mappings (fzf-lua)
map("n", "<leader>fh", function()
	require("fzf-lua").help_tags()
end, { desc = "[F]ind [H]elp" })
map("n", "<leader>fk", function()
	require("fzf-lua").keymaps()
end, { desc = "[F]ind [K]eymaps" })
map("n", "<leader>ff", function()
	require("fzf-lua").files()
end, { desc = "[F]ind [F]iles" })
map("n", "<leader>fs", function()
	require("fzf-lua").builtin()
end, { desc = "[F]ind [S]elect FZF" })
map("n", "<leader>fw", function()
	require("fzf-lua").grep_cword()
end, { desc = "[F]ind current [W]ord" })
map("n", "<leader>fg", function()
	require("fzf-lua").live_grep()
end, { desc = "[F]ind by [G]rep" })
map("n", "<leader>fd", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "[F]ind [D]iagnostics" })
map("n", "<leader>fr", function()
	require("fzf-lua").resume()
end, { desc = "[F]ind [R]esume" })
map("n", "<leader>f.", function()
	require("fzf-lua").oldfiles()
end, { desc = "[F]ind Recent Files" })
map("n", "<leader><leader>", function()
	require("fzf-lua").buffers()
end, { desc = "Find buffers" })
map("n", "<leader>f/", function()
	require("fzf-lua").grep_curbuf()
end, { desc = "Find in current buffer" })
map("n", "<leader>fn", function()
	require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[F]ind [N]eovim files" })

-- == Buffer Management ==
map("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Previous buffer" })
map("n", "<leader>bf", "<cmd>bf<CR>", { desc = "First buffer" })
map("n", "<leader>bl", "<cmd>bl<CR>", { desc = "Last buffer" })

-- == Window/Split Management ==
map("n", "<leader>ws", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close window" })
map("n", "<leader>wo", "<cmd>only<CR>", { desc = "Close other windows" })

-- == Diagnostics ==
map("n", "<leader>xq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- == Terminal ==
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- == Window Navigation ==
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- TIP: Disable arrow keys in normal mode (uncomment if wanted)
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- == Editor Utilities ==
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "%", "ggVG", { desc = "Select all" })

-- == Commenting ==
map("n", "<leader>c", "gcc", { desc = "Comment toggle line" })
map("v", "<leader>c", "gc", { desc = "Comment toggle selection" })

-- == File Explorer ==
map("n", "<leader>e", function()
	require("mini.files").open()
end, { desc = "Open mini.files" })

map("n", "<leader>E", function()
	require("snacks").explorer()
end, { desc = "Open snacks.explorer" })

-- == Terminal ==
map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle terminal float" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle terminal horizontal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle terminal vertical" })

-- == Outline ==
map("n", "<leader>o", "<cmd>AerialToggle!<CR>", { desc = "Toggle aerial outline" })

-- == Sessions ==
map("n", "<leader>ss", "<cmd>AutoSession save<CR>", { desc = "Save session" })
map("n", "<leader>sl", "<cmd>AutoSession search<CR>", { desc = "Load session" })
map("n", "<leader>sd", "<cmd>AutoSession delete<CR>", { desc = "Delete session" })
