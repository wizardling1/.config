
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local function update_colorscheme_file(scheme)
  local colorscheme_file = vim.fn.stdpath('config') .. '/lua/igor/colorscheme.lua'
  local file = io.open(colorscheme_file, 'w')
  if file then
    file:write('vim.cmd("colorscheme ' .. scheme .. '")\n')
    file:close()
    print('Updated colorscheme to ' .. scheme)
  else
    print('Error: Could not write to colorscheme.lua')
  end
end

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = require('telescope.actions').close,  -- Quit in insert mode (Ctrl+q)
        ["<C-p>"] = function(prompt_bufnr)
          local selected = action_state.get_selected_entry()
	  update_colorscheme_file(selected.value)
          actions.close(prompt_bufnr)
        end,
        -- Apply preview as you scroll through the list
        ["<C-j>"] = function(prompt_bufnr)
          actions.move_selection_next(prompt_bufnr)
          local selected = action_state.get_selected_entry()
          vim.cmd("colorscheme " .. selected.value)
        end,
        ["<C-k>"] = function(prompt_bufnr)
          actions.move_selection_previous(prompt_bufnr)
          local selected = action_state.get_selected_entry()
          vim.cmd("colorscheme " .. selected.value)
        end,
      },
      n = {
        ["q"] = require('telescope.actions').close,      -- Quit in normal mode with 'q'
      },
    },
  }
}

