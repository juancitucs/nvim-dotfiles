-- Collection of various small independent plugins/modules
return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.starter").setup()
		require("mini.ai").setup({ n_lines = 500 })
		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Smooth animations (commented to use snacks.scroll)
		-- require('mini.animate').setup()

		-- Bracketed motions (commented, no direct snacks equivalent)
		-- require('mini.bracketed').setup()

		-- Highlight word under cursor (commented to use snacks.words)
		-- require('mini.cursorword').setup()

		-- File explorer
		require("mini.files").setup({
			mappings = {
				close = "q",
				go_in = "<CR>",
				go_in_plus = "l",
				go_out = "h",
				go_out_plus = "H",
				-- Add more overrides here
			},
			options = {
				-- Enable git integration
				use_as_default_explorer = true,
				content = {
					git = { enabled = true },
				},
			},
			windows = {
				preview = true,
				width_preview = 50,
			},
		})

		-- Additional arrow key mappings for mini.files
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				vim.keymap.set("n", "<Left>", "h", { buffer = buf_id, remap = true })
				vim.keymap.set("n", "<Right>", "l", { buffer = buf_id, remap = true })
				vim.keymap.set("n", "<Up>", "k", { buffer = buf_id, remap = true })
				vim.keymap.set("n", "<Down>", "j", { buffer = buf_id, remap = true })
			end,
		})

		-- Visualize and work with indent scope (disabled to use snacks.indent)
		-- require("mini.indentscope").setup()

		-- Autopairs
		require("mini.pairs").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- Mini tabline (commented to use barbar for visual tabs)
		-- require("mini.tabline").setup()

		-- Mini notify (notifications) - commented to use snacks.notifier
		-- require("mini.notify").setup()

		-- Mini pick (fuzzy finder)
		require("mini.pick").setup()

		-- Mini extra (additional pickers, including LSP)
		require("mini.extra").setup()

		-- Mini diff (git diffs)
		require("mini.diff").setup()

		-- Mini visits (file visits)
		require("mini.visits").setup()

		-- Mini git (git commands and integration)
		require("mini.git").setup()

		-- Mini base16 with pastel colors close to white, saturated
		require("mini.base16").setup({
			palette = {
				base00 = "#121212", -- background (terminal color)
				base01 = "#1A1A1A", -- background lighter
				base02 = "#2A2A2A", -- selection
				base03 = "#606060", -- comments (lighter)
				base04 = "#808080", -- line numbers (lighter)
				base05 = "#E6E6E6", -- foreground (very light gray)
				base06 = "#F0F0F0", -- foreground lighter
				base07 = "#FAFAFA", -- foreground lightest
				base08 = "#FFB3B3", -- light red
				base09 = "#FFD4A3", -- light orange
				base0A = "#FFF2B3", -- light yellow
				base0B = "#C3F0C3", -- light green
				base0C = "#B3E5FF", -- light cyan
				base0D = "#C3C3FF", -- light blue
				base0E = "#B3E5FF", -- light sky blue pastel
				base0F = "#FFC3E6", -- light magenta
			},
		})
		-- Make background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		-- Make selected item background white and foreground black
		vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { fg = "#000000", bg = "#FFFFFF" })
		-- Make mini.files directory color light sky blue pastel
		vim.api.nvim_set_hl(0, "MiniFilesDirectory", { fg = "#B3E5FF" })

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
