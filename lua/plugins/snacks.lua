return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = true }, -- Keep explorer
        indent = { enabled = true }, -- Keep indent
        input = { enabled = true },
        picker = { enabled = false }, -- Disabled since using fzf-lua
        notifier = { enabled = true }, -- Enable notifier
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    },
}
