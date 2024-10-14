-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- TOOLS
	--
	require("hels.plugins.mason"),

	--  EDITOR
	--
	require("hels.plugins.which-key"),
	require("hels.plugins.telescope"),
	require("hels.plugins.conform"),
	require("hels.plugins.todo-comments"),
	require("hels.plugins.treesitter"),
	require("hels.plugins.undotree"),
	require("hels.plugins.toggleterm"),
	require("hels.plugins.indent_line"),
	require("hels.plugins.autopairs"),
	require("hels.plugins.oil"),
	{ "numToStr/Comment.nvim", opts = {} }, -- gc gcc
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- THEME
	-- require 'hels.plugins.tokyonight',
	require("hels.plugins.catppuccin"),
	-- require 'hels.plugins.alligator_accent',

	-- CODE
	--
	require("hels.plugins.lspconfig"),
	require("hels.plugins.cmp"),
	require("hels.plugins.go-nvim"), -- golang

	-- TEST
	--
	require("hels.plugins.neotest"),

	-- VERSION CONTROL
	--
	require("hels.plugins.gitsigns"),
	require("hels.plugins.lazygit"),
	require("hels.plugins.git-worktree"),

	-- HTTP Request
	--
	require("hels.plugins.hurl"),
	-- require("hels.plugins.nvimhttp"),
	-- require("hels.plugins.ijhttp"),

	-- DATABASE
	-- require 'hels.plugins.dadbod',
	require("hels.plugins.dbee"),

	require("hels.plugins.mini"),

	-- require 'hels.plugins.lint',

	-- Notes
	require("hels.plugins.obsidian"),

	-- LOG
	require("hels.plugins.log-highlight"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
