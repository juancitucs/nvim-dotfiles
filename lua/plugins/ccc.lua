-- Plugin: uga-rosa/ccc.nvim
-- Color picker and highlighter

return {
    "uga-rosa/ccc.nvim",
    config = function()
        require("ccc").setup({
            -- Your preferred settings
            highlighter = {
                auto_enable = true,
                lsp = true,
            },
        })
    end,
}
