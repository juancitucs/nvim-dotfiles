return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			-- Add any custom config here
		})
	end,
	cmd = "FzfLua", -- Lazy load on command
}

