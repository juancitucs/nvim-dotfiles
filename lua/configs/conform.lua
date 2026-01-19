local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        python = { "ruff_format" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        cs = { "csharpier" },
        html = { "prettier" },
        css = { "biome" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        yaml = { "prettier" },
        toml = { "taplo" },
        tex = { "latexindent" },
        typst = { "typstyle" },
        bib = { "bibtex-tidy" },
        php = { "php-cs-fixer" },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },

    formatters = {
        stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        },
        ["clang-format"] = {
            prepend_args = { "--style", "{IndentWidth: 4, UseTab: Never}" },
        },
    },
    format_on_save = true,
}
--     format_on_save = function(bufnr)
--         -- Disable "format_on_save lsp_fallback" for languages that don't
--         -- have a well standardized coding style. You can add additional
--         -- languages here or re-enable it for the disabled ones.
--         local disable_filetypes = { c = true, cpp = true }
--         local filetype = vim.bo[bufnr].filetype
--         if disable_filetypes[filetype] then
--             return nil
--         elseif filetype == "python" then
--             -- Use conform only for Python to avoid LSP issues
--             return {
--                 timeout_ms = 500,
--             }
--         else
--             return {
--                 timeout_ms = 500,
--                 lsp_format = "fallback",
--             }
--         end
--     end,
-- }

return options
