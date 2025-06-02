return {
	  { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
	  { "nvim-tree/nvim-tree.lua" },
	  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	  { 'nvimdev/dashboard-nvim', 
        event = 'VimEnter', 
	    dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    { 'marko-cerovac/material.nvim' },
    {'folke/tokyonight.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    { 'L3MON4D3/LuaSnip' },  -- Snippet engine
    { 'saadparwaiz1/cmp_luasnip' }, -- Snippet completion source for nvim-cmp
    { 'lervag/vimtex', config = function() 
        -- Set Skim as the PDF viewer
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_view_skim_activate = 1

        -- Use latexmk as the compiler
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk = {
            options = { 
                '-synctex=1', 
                '-interaction=nonstopmode', 
                '-file-line-error', 
                '-pdf', 
                '-silent'
            },
            continuous = 1,
        }

        -- Key mappings for compiling and stopping compilation
        -- vim.keymap.set('n', '<leader>ll', ':%s/x/y/g', { silent = true })
        -- vim.keymap.set('n', '<leader>ll', ':VimtexCompile<CR>', { silent = true })
        -- vim.keymap.set('n', '<leader>lk', ':VimtexStop<CR>', { silent = true })
    end
    },
    {
	    'Julian/lean.nvim',
	    event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

	    dependencies = {
		    'neovim/nvim-lspconfig',
		    'nvim-lua/plenary.nvim',

        -- optional dependencies:

        -- a completion engine
        --    hrsh7th/nvim-cmp or Saghen/blink.cmp are popular choices

        -- 'nvim-telescope/telescope.nvim', -- for 2 Lean-specific pickers
        -- 'andymass/vim-matchup',          -- for enhanced % motion behavior
        -- 'andrewradev/switch.vim',        -- for switch support
        -- 'tomtom/tcomment_vim',           -- for commenting
      },

      ---@type lean.Config
      opts = { -- see below for full configuration options
        mappings = true,
      }
    },

    {
      "OXY2DEV/markview.nvim",
      lazy = false,

      -- For blink.cmp's completion
      -- source
      -- dependencies = {
        --     "saghen/blink.cmp"
        -- },
      },
    }

