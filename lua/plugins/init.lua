-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
local plugins = {
    require("plugins.rustaceanvim"),
    require("plugins.guess-indent"),
    require("plugins.gitsigns"),
    require("plugins.which-key"),
    require("plugins.lazydev"),
    require("plugins.blink"),
    require("plugins.colorscheme"),
    require("plugins.todo-comments"),
    require("plugins.treesitter"),
    require("plugins.flash"),
    require("plugins.store"),
    require("plugins.texpresso"),
    require("plugins.tiny-inline-diagnostic"),
    require("plugins.typst-preview"),
    require("plugins.vimtex"),
    require("plugins.neovide"),
    require("plugins.overseer-extra"),
    require("plugins.overseer"),
    require("plugins.mini"),
    require("plugins.nvim-numbertoggle"),
    -- Picker plugins for switching
    require("plugins.fzf-lua"),
    require("plugins.telescope"),
    require("plugins.snacks"),
    -- Other plugins
    require("plugins.toggleterm"),
    require("plugins.aerial"),
    require("plugins.auto-session"),
    require("plugins.zen-mode"),
    require("plugins.barbar"),
    -- Additional recommended plugins
    require("plugins.trouble"),
    require("plugins.harpoon"),
    -- require("plugins.noice"),
    -- NOTE: Keep plugin definitions in separate files under lua/plugins/
    -- Do not add inline plugin configs here to maintain organization
    require("plugins.conform"),
    require("plugins.lspconfig"),
    require("plugins.ts-comments"),
    require("plugins.godot"),
    require("plugins.crates"),
}

return plugins
