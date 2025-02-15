local cmp = require("cmp")
local luasnip = require("luasnip")

-- To setup completation engine(nvim-cmp), you must call the setup method filling the given fields:
--      snippet --> the snippet engine initialization. You must provide an expand function definition
--      sources --> the listing of what plugins to search/query for completations.
--      mapping --> a dictionary of keymappings which are responsible for controlling tooltips.
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
         { name = 'nvim_lsp' },    -- For nvim-lsp
         { name = 'luasnip' },     -- For luasnip user
         { name = 'buffer' },      -- For buffer word completion
         { name = 'path' },        -- For path completion
    }),

    mapping = {
        -- ... Your other mappings ...
       ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm({
                        select = true,
                    })
                end
            else
                fallback()
            end
        end),
    
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
    
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
    
    },
})

