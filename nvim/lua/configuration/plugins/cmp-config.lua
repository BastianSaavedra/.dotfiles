---@diagnostic disable: missing-fields
local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local M = {}
local compare = cmp.config.compare
-- local kind_mapper = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 }
-- local kind_mapper = require("cmp.types").lsp.CompletionItemKind
--
-- local kind_score = {
--     Variable = 1,
--     Class = 2,
--     Keyword = 3,
--     Method = 4
-- }
function M.setup()
    cmp.setup({
        window = {
            completion = {
                border = "rounded",
            },
            documentation = {
                border = "rounded",
            },
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
            -- { name = "emmet_vim" },
        },
        sorting = {
            comparators = {
                compare.offset,
                compare.exact,
                compare.score,
                require "cmp-under-comparator".under,
                compare.kind,
                compare.sort_text,
                compare.length,
                compare.order, -- compare.offset,
                -- compare.exact,
                -- function(entry1, entry2)
                --     local kind1 = kind_score[kind_mapper[entry1:get_kind()]] or 100
                --     local kind2 = kind_score[kind_mapper[entry2:get_kind()]] or 100
                --
                --     if kind1 < kind2 then
                --         return true
                --     end
                -- end
            }

        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                local KIND_ICONS = {
                    Tailwind = '󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞',
                    Text = "󰉿",
                    Method = "󰆧",
                    Function = "󰊕",
                    Constructor = " ", -- nf-fa-gears
                    Field = "󰜢",
                    Variable = "󰫧 ", -- nf-md-variable
                    Class = "󰠱",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "󰑭",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌆 ", -- nf-md-key
                    Color = ' ', -- nf-fase-palette_color
                    Snippet = "󰅴 ", -- nf-md-code_tags
                    File = "󰈙",
                    Reference = "󰈇",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "󰙅",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "",
                }
                if vim_item.kind == 'Color' and entry.completion_item.documentation then
                    local _, _, r, g, b =
                    ---@diagnostic disable-next-line: param-type-mismatch
                        string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')

                    if r and g and b then
                        local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
                        local group = 'Tw_' .. color

                        if vim.api.nvim_call_function('hlID', { group }) < 1 then
                            vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. color)
                        end

                        vim_item.kind = KIND_ICONS.Tailwind
                        vim_item.kind_hl_group = group

                        return vim_item
                    end
                end


                local kind = vim_item.kind
                vim_item.kind = (KIND_ICONS[kind] or "?") .. " "

                local source = entry.source.name
                vim_item.menu = " (" .. source .. ")"
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    buffer = "[Buffer]",
                    emmet_vim = "[emmet]",
                    path = "[Path]"

                })[entry.source.name]

                vim_item.abbr = vim_item.abbr:match("[^(]+")


                return vim_item
            end,
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<C-n>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.choice_active() then
                    luasnip.change_choice(1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<c-k>"] = cmp.mapping.select_prev_item(),
            ["<c-j>"] = cmp.mapping.select_next_item(),
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            ["c-space>"] = cmp.mapping.complete(),
        },
    })
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

    -- Set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = 'git' } -- You can specify the `git` source if you installed the cmp-git
        }, {
            { name = 'buffer' }
        })
    })

    -- Use buffer source for `/` and `?` ( if you enabled `native_menu`, this won't
    -- work anymore)
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':'
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
end

return M
