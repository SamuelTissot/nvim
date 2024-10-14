return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("oil").setup({
			-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
			-- Set to false if you still want to use netrw.
			default_file_explorer = true,
			columns = { "icon" },
			view_options = {
				show_hidden = true,
			},

			use_default_keymaps = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-S>"] = "actions.select_vsplit",
				["<C-B>"] = "actions.select_split",
				["<C-T>"] = "actions.select_tab",
				["<C-P>"] = "actions.preview",
				["<C-X>"] = "actions.close",
				["<C-R>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},

			-- KEYMAPS
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
			vim.keymap.set("n", "<space>-", require("oil").toggle_float, { desc = "floating oil" }),
		})
	end,
}
