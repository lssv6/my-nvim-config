return {
    "folke/which-key.nvim",

    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons", -- Dependency of lualine

    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- Dependency of telescope
    "BurntSushi/ripgrep", -- Optional dependency for telescope. Needed for the live-grep feature.

    -- Theme/Colorscheme 
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- lspconfig plugin. Manages LSP's
    -- Configurations:
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Nvim completation engine
    {"hrsh7th/nvim-cmp", config = function() require("config.nvim-cmp") end},

    -- Dependencies for nvim-cmp
    "hrsh7th/cmp-nvim-lsp", -- lsp     auto-completion
    "hrsh7th/cmp-buffer",   -- buffer  auto-completion
    "hrsh7th/cmp-path",     -- path    auto-completion
    "hrsh7th/cmp-cmdline",  -- cmdline auto-completion

    -- LuaSnip snippet engine. Also dependency for nvim-cmp
    {"L3MON4D3/LuaSnip",version = "v2.3.0", build = "make install_jsregexp"},
    -- Snippet engine is what writes the remaining
    "saadparwaiz1/cmp_luasnip", -- luasnip -> nvim-cmp integration

    -- Vscode-like pictograms, also dependency for nvim-cmp
    {"onsails/lspkind.nvim",event = { "VimEnter" }},
    -- Treesitter. Better parsing and variable coloring.
    {"nvim-treesitter/nvim-treesitter", config = function() require("config.nvim-treesitter") end}
}

