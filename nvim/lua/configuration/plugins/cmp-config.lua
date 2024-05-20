---@diagnostic disable: missing-fields
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require("luasnip")
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local M = {}
local compare = cmp.config.compare

-- local theme = require("./themes.lua")
--
-- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = theme.blue, bg = "NONE" })
-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = theme.cyan, bg = "NONE" })


local icons = {
    Tailwind = '󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞',
    Text = "󰉿 ",
    Method = "󰆧 ",
    Function = "󰊕 ",
    Constructor = " ", -- nf-fa-gears
    Field = "󰜢 ",
    Variable = "󰫧 ", -- nf-md-variable
    Class = "󰠱 ",
    Interface = " ",
    Module = " ",
    Property = "󰜢 ",
    Unit = "󰑭 ",
    Value = "󰎠 ",
    Enum = " ",
    Keyword = "󰌆 ", -- nf-md-key
    Color = " ", -- nf-fase-palette_color
    Snippet = "󰅴 ", -- nf-md-code_tags
    File = "󰈙 ",
    Reference = "󰈇 ",
    Folder = "󰉋 ",
    EnumMember = " ",
    Constant = "󰏿 ",
    Struct = "󰙅 ",
    Event = " ",
    Operator = "󰆕 ",
    TypeParameter = "",
}

function M.setup()
    cmp.setup({
        window = {
            completion = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            },
            documentation = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            },
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip", keyword_length = 2 },
            { name = "buffer",  keyword_length = 3 },
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
            }

        },
        formatting = {
            fields = { "abbr", "kind", "menu" },
            format = function(entry, vim_item)
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

                        vim_item.kind = icons.Tailwind
                        vim_item.kind_hl_group = group

                        return vim_item
                    end
                end


                local kind = vim_item.kind
                vim_item.kind = string.format("%s", icons[kind] or "?") .. " " .. kind

                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]",

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
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-f>"] = cmp_action.luasnip_jump_forward(),
            ["<C-b>"] = cmp_action.luasnip_jump_backward(),
            ["<Tab>"] = cmp_action.luasnip_supertab(),
            ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
        })
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
