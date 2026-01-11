-- Plugin: nvim-tree/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup {
      git = {
        enable = true,
        ignore = false,
      },
      renderer = {
        icons = {
          git_placement = "after",
          glyphs = {
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    }
  end,
}