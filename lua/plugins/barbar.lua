-- Plugin: romgrk/barbar.nvim
-- Installed via store.nvim

return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = function()
        require("barbar").setup({
            animation = true,
            icons = {
                buffer_index = true,
                buffer_number = false,
            },
            -- Custom mappings for <A-number> (hidden from whichkey)
            vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>"),
            vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>"),
            vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>"),
            vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>"),
            vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>"),
            vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>"),
            vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>"),
            vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>"),
            vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>"),
            -- Buffer picker with fzf-lua
            vim.keymap.set("n", "<C-Tab>", function()
                require("fzf-lua").buffers()
            end),
            -- Fuzzy finder for LSP completions
            vim.keymap.set({ "n", "i" }, "<A-Tab>", function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if #clients == 0 then
                    return
                end
                local client = clients[1]
                local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
                vim.lsp.buf_request(0, "textDocument/completion", params, function(err, result, ctx, config)
                    if err or not result then
                        return
                    end
                    local items = result.items or result
                    if #items == 0 then
                        return
                    end
                    local labels = {}
                    for _, item in ipairs(items) do
                        table.insert(labels, item.label .. (item.detail and " - " .. item.detail or ""))
                    end
                    require("fzf-lua").fzf_exec(labels, {
                        prompt = "Completions> ",
                        actions = {
                            ["default"] = function(selected)
                                if selected and selected[1] then
                                    local label = selected[1]:match("^(.-) %- ") or selected[1]
                                    local selected_item
                                    for _, item in ipairs(items) do
                                        if item.label == label then
                                            selected_item = item
                                            break
                                        end
                                    end
                                    if selected_item then
                                        local insert_text = selected_item.insertText
                                            or (selected_item.textEdit and selected_item.textEdit.newText)
                                            or selected_item.label
                                        if
                                            insert_text and insert_text:find("%$")
                                            or selected_item.insertTextFormat == 2
                                        then
                                            require("luasnip").lsp_expand(insert_text)
                                        else
                                            local row, col = unpack(vim.api.nvim_win_get_cursor(0))
                                            local line = vim.api.nvim_get_current_line()
                                            local word_start =
                                                vim.fn.matchstrpos(line, "\\k*\\%" .. (col + 1) .. "c")[2]
                                            local final_text = insert_text
                                            local cursor_offset = 0
                                            if selected_item.kind == 2 or selected_item.kind == 3 then -- method or function
                                                final_text = final_text .. "()"
                                                cursor_offset = #insert_text + 1
                                            end
                                            if selected_item.textEdit then
                                                selected_item.textEdit.newText = final_text
                                                vim.lsp.util.apply_text_edits(
                                                    { selected_item.textEdit },
                                                    0,
                                                    client.offset_encoding
                                                )
                                            else
                                                vim.api.nvim_buf_set_text(
                                                    0,
                                                    row - 1,
                                                    word_start,
                                                    row - 1,
                                                    col,
                                                    { final_text }
                                                )
                                            end
                                            if cursor_offset > 0 then
                                                vim.api.nvim_win_set_cursor(0, { row, word_start + cursor_offset })
                                            end
                                        end
                                        vim.schedule(function()
                                            vim.cmd("startinsert")
                                        end)
                                    end
                                end
                            end,
                        },
                    })
                end)
            end),
        })
    end,
    version = "^1.0.0",
}
