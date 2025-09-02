local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local function update_colorscheme_file(scheme)
  -- write to colorscheme_light.lua or colorscheme_dark.lua depending on current background
  local mode = vim.o.background == "light" and "light" or "dark"
  local colorscheme_file = vim.fn.stdpath('config') .. '/lua/igor/colorscheme_' .. mode .. '.lua'

  local file = io.open(colorscheme_file, 'w')
  if file then
    file:write('vim.o.background = "' .. mode .. '"\n')
    file:write('vim.cmd("colorscheme ' .. scheme .. '")\n')
    file:close()
    print('Saved ' .. scheme .. ' to colorscheme_' .. mode .. '.lua')
  else
    print('Error: Could not write to ' .. colorscheme_file)
  end
end

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.close,
        -- Confirm selection: apply & persist to the right file (light/dark)
        ["<C-p>"] = function(prompt_bufnr)
          local selected = action_state.get_selected_entry()
          update_colorscheme_file(selected.value)
          actions.close(prompt_bufnr)
          vim.cmd("colorscheme " .. selected.value)
        end,
        -- Live preview while navigating (no save)
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
      n = { ["q"] = actions.close },
    },
  }
}

