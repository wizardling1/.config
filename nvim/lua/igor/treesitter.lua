require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "python", "lua", "javascript", "html", "css" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Disable for specific languages
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    additional_vim_regex_highlighting = false,
  },
}

