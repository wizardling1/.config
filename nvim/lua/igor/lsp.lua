-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- select languages 
require('lspconfig').hls.setup({
})
require('lspconfig').clangd.setup({
    cmd = {"clangd", "--query-driver=/usr/bin/g++" },
})
require('lspconfig').pyright.setup({})
require('lspconfig').html.setup({})
require('lspconfig').cssls.setup({})
require('lspconfig').ts_ls.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  flags = {
    debounce_text_changes = 150,
  },

})
require'lspconfig'.texlab.setup{
    settings = {
        texlab = {
            build = {
                onSave = false,
            },
            forwardSearch = {
                executable = "open",  -- Command for forward search
                args = { "-a", "Skim", "%p" },
            },
            chktex = {
                onOpenAndSave = true,  -- Run linting on open and save
            },
        },
    },
}


-- autocomplete setup
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
      ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
      ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
      ['<C-y>'] = cmp.mapping.complete({
          behavior = cmp.ConfirmBehavior.replace,
          select = true
        }),
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)  
    end,
  },
})
