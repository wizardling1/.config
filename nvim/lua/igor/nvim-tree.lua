-- Set up nvim-tree configuration
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "right",
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  filters = {
    dotfiles = false,  -- Show hidden files (dotfiles)
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})

