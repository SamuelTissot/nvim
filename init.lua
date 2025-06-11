-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
require("hels.core.options")

-- [[ Basic Keymaps ]]
require("hels.core.keymaps").basicKeymaps()

-- [[ Install `lazy.nvim` plugin manager ]]
require("lazy-bootstrap")

-- [[ Configure and install plugins ]]
require("plugins")

-- [[ Autocommands ]]
require("hels.core.autocmd")

-- [[ Git Worktree ]]
require("hels.core.gitworktree")

-- [[ Post INIT ]]
require("hels.core.post_init")


-- use telescope as the vim.ui.select
require('telescope').setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}
require("telescope").load_extension("ui-select")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
