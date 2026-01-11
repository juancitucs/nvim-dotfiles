-- VSCode theme with transparency and pastel desaturated colors
return {
	"Mofiqul/vscode.nvim",
	priority = 1000,
	config = function()
		require("vscode").setup({
			transparent = true, -- Enable transparency
			italic_comments = true, -- Italic comments for pastel feel
			-- Other options for pastel desaturated look
			color_overrides = {
				-- Customize search highlights for better visibility
				vscSearch = "#4A90E2", -- Blue for search matches
				vscSearchCurrent = "#FF6B6B", -- Red for current match
			},
		})
		vim.cmd.colorscheme("vscode")
	end,
}