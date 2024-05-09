local ls = require "luasnip"
local types = require "luasnip.util.types"

local M = {}

function M.setup()
    ls.config.set_config {
        -- This tells LuaSnip to remember to keep around the las snippet.
        -- You can jump back into even if you move outside of the selection
        history = true,

        -- This one is cool cause if you have dyncamic snippets, it updatesas
        -- you type!
        updateevents = "TextChanged,TextChangedI",

        -- Autosnippets:
        enable_autosnippets = true,

        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = { { "<- Choice", "Error" } },
                },
            },
        },
    }

    -- <c-k> is my expancion key
    -- this will expand the current item or jump to next item within the snippet
    vim.keymap.set({ "i", "s" }, "<c-k>", function ()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end, { silent = true })

    -- <c-j> is muy jump backwars key.
    -- this always moves to the previous item within the snippet
    vim.keymap.set({ "i", "s" }, "<c-j>", function ()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end, { silent = true })

    -- <c-l> is selecting within a list of options.
    -- this is useful for choice nodes (introducd in the forthcoming episode 2)
    vim.keymap.set("i", "<c-l>", function ()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end)
end

return M


