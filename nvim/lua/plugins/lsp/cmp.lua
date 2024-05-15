return {
    "hrsh7th/nvim-cmp", -- Motor de busqueda
    dependencies = {
        "hrsh7th/cmp-buffer",   -- Lee los buffers abiertos para ayudarnos al autocompletado 
        "hrsh7th/cmp-path",     -- Nos ayuda a leer la ubicacion de los archivos 
        "hrsh7th/cmp-nvim-lsp", -- Nos da la conexion con los servidores lsp 
        "hrsh7th/cmp-cmdline",  -- Autocompleta la linea de comandos
        "hrsh7th/cmp-git",      -- Da contexto en relacion a git 
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "lukas-reineke/cmp-under-comparator",
        "windwp/nvim-autopairs", -- Cerrar llaves
        -- {
        --     "dcampos/cmp-emmet-vim",
        --     dependencies = "mattn/emmet-vim"
        -- }
    },
    event = "VeryLazy",
    main = "configuration.plugins.cmp-config",
    config = true,
}
