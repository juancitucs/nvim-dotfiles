-- Plugin: stevearc/conform.nvim
-- Lightweight yet powerful formatter plugin for Neovim

return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require("configs.conform"),
    keys = {
        {
            "<leader>F",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
}
