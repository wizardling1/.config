return {
    --[[
    {
      "OXY2DEV/markview.nvim",
      lazy = false,
    },
    ]]
    {
      "okuuva/auto-save.nvim",
      opts = {
        enabled = true,
        trigger_events = {
          immediate_save = { "BufLeave", "FocusLost" },
          defer_save = { "InsertLeave", "TextChanged" },
          cancel_deferred_save = { "InsertEnter" },
        },
        debounce_delay = 1000,
        condition = function(buf)
          local ft = vim.bo[buf].filetype
          local exclude = { "gitcommit", "TelescopePrompt" }
          return not vim.tbl_contains(exclude, ft)
        end,
      },
    },
    {
      "f-person/auto-dark-mode.nvim",
      config = function()
        local function load_saved_scheme(mode)
          local path = vim.fn.stdpath("config") .. "/lua/igor/colorscheme_" .. mode .. ".lua"
          pcall(dofile, path)   -- safe: won't error if file missing
        end

        require("auto-dark-mode").setup({
          update_interval = 750,
          set_dark_mode = function()
            vim.o.background = "dark"
            load_saved_scheme("dark")
          end,
          set_light_mode = function()
            vim.o.background = "light"
            load_saved_scheme("light")
          end,
        })
        require("auto-dark-mode").init()

        -- Also load once on startup (before the first OS callback fires)
        if vim.o.background == "dark" then
          load_saved_scheme("dark")
        else
          load_saved_scheme("light")
        end
      end,
    },
    { "EdenEast/nightfox.nvim" },
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
      "linux-cultist/venv-selector.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap", 
        "mfussenegger/nvim-dap-python",
        { 
          "nvim-telescope/telescope.nvim", 
          branch = "0.1.x", 
          dependencies = { "nvim-lua/plenary.nvim" } 
        },
      },
      lazy = false,
      keys = {
        { ",v", "<cmd>VenvSelect<cr>" },
      },
      ---@type venv-selector.Config
      opts = {
        search = {
          anaconda_base = {
            command = "fd python$ /Users/kovalenko1/homebrew/Caskroom/miniforge/base/envs --full-path --color never -E /proc",
            type = "anaconda",
          },
        },
      },
    },
    {
    "Shatur/neovim-ayu",
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = false,
        terminal = true,
        overrides = {},
      })
    end,
  }
}
