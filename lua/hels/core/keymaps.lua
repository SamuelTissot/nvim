---- CORE REMAPS
vim.keymap.set("x", "<leader>p", "\"_dP", { noremap = true, silent = true, desc= "past without replacing value" })



-- Module to export function to be required in plugins
-- This is done to keep all keymaps at the same place
local M = {}

M.keymapsGroup = function()
	return {
		{ "<leader>a", group = "[a]i" }, -- group
		{ "<leader>f", group = "[f]ile" }, -- group
		{ "<leader>c", group = "[c]ode" }, -- group
		{ "<leader>s", group = "[s]each" },
		{ "<leader>t", group = "[t]est" },
		{ "<leader>o", group = "[o]perations" },
		{ "<leader>x", group = "[x] diagnostics" },
		{ "<leader>u", group = "[u]ser" },
		{ "<leader>n", group = "[n]otec" },
		{ "<leader>g", group = "[g]it" },
		{ "<leader>r", group = "[r]equest" },
	}
end

M.copilotChatKeys = function()
	vim.keymap.set("n", "<leader>ac", "<cmd>CopilotChatToggle<CR>", { desc = "[C]hat" })
	vim.keymap.set("n", "<leader>ax", "<cmd>CopilotChatStop<CR>", { desc = "Stop" })
	vim.keymap.set("n", "<leader>ar", "<cmd>CopilotChatReset<CR>", { desc = "[r]eset" })
	vim.keymap.set("n", "<leader>ap", "<cmd>CopilotChatPrompts<CR>", { desc = "[p]rompts" })
	vim.keymap.set("n", "<leader>am", "<cmd>CopilotChatModels<CR>", { desc = "[m]odels" })

	vim.keymap.set("i", "<M-|>", 'copilot#Accept("\\<CR>")', {
		expr = true,
		replace_keycodes = false,
	})
	vim.g.copilot_no_tab_map = true
end

M.setTelescopeKeys = function()
	local builtin = require("telescope.builtin")
	local utils = require("telescope.utils")
	-- SEARCH
	vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[s]earch [H]elp" })
	vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[s]earch [K]eymaps" })
	vim.keymap.set("n", "<leader>sb", builtin.builtin, { desc = "[s]earch [B]uiltin" })
	vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[s]earch [R]esume" })
	vim.keymap.set("n", "<leader>sg", builtin.grep_string, { desc = "[s]earch [g]rep" })
	vim.keymap.set("n", "<leader>sG", builtin.live_grep, { desc = "[s]earch project [G]rep" })
	vim.keymap.set("n", "<leader>sd", function()
		builtin.find_files({ cwd = utils.buffer_dir() })
	end, { desc = "[s]earch [D]irectory" })
	-- Slightly advanced example of overriding default behavior and theme
	vim.keymap.set("n", "<leader>s/", function()
		-- You can pass additional configuration to Telescope to change the theme, layout, etc.
		builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, { desc = "[s]earch [/] Fuzzily search in current buffer" })
	-- It's also possible to pass additional configuration options.
	--  See `:help telescope.builtin.live_grep()` for information about particular keys
	vim.keymap.set("n", "<leader>sF", function()
		builtin.live_grep({
			grep_open_files = true,
			prompt_title = "Search Grep Open Files",
		})
	end, { desc = "[s]earch grep open [F]ile" })
	-- Shortcut for searching your Neovim configuration files
	vim.keymap.set("n", "<leader>sC", function()
		builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[s]earch [C]onfig" })

	-- File
	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ile [F]iles" })
	vim.keymap.set("n", "<leader>fv", builtin.git_files, { desc = "[f]ile [v]ersion controled" })
	vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[f]ile [r]ecent" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[f]ile buffers" })

	-- Diagnostic
	vim.keymap.set("n", "<leader>xx", builtin.diagnostics, { desc = "[x] diagnostics" })

	-- Operation
	vim.keymap.set("n", "<leader>ow", function()
		require("telescope").extensions.git_worktree.git_worktrees()
	end, { desc = "[o]perations [w]orktree" })
	vim.keymap.set("n", "<leader>oW", function()
		require("telescope").extensions.git_worktree.create_git_worktree()
	end, { desc = "[o]operation [W]orktree (new)" })
end

M.toggleTermKeys = function()
	return {
		{
			"<leader>ot",
			function()
				vim.cmd(vim.v.count1 .. "ToggleTerm direction=float")
			end,
			{ desc = "[o]perate [t]erminal" },
		},
	}
end

M.undotreeKeys = function()
	return {
		{ "<leader>u", vim.cmd.UndotreeToggle, { desc = "[u]ndotreeToggle" } },
	}
end

M.basicKeymaps = function()
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

	-- Diagnostic keymaps
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
	vim.keymap.set("n", "<leader>xe", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
	vim.keymap.set("n", "<leader>xq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

	-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
	-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
	-- is not what someone will guess without a bit more experience.
	--
	-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
	-- or just use <C-\><C-n> to exit terminal mode
	vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

	-- Keybinds to make split navigation easier.
	--  Use CTRL+<hjkl> to switch between windows
	--
	--  See `:help wincmd` for a list of all window commands
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
end

M.conformKeys = function()
	return {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n" },
			desc = "[C]ode [F]ormat",
		},
	}
end

M.hurlKeys = function()
	return {
		-- Run API request
		{ "<leader>rA", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
		{ "<leader>ra", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
		{ "<leader>re", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
		{ "<leader>rt", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
		{ "<leader>rv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
		-- Run Hurl request in visual mode
		{ "<leader>rh", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
	}
end

M.lazyGitKeys = function()
	return {
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
	}
end

M.LspKeys = function(event)
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end

	-- Jump to the definition of the word under your cursor.
	--  This is where a variable was first declared, or where a function is defined, etc.
	--  To jump back, press <C-t>.
	map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

	-- Find references for the word under your cursor.
	map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

	-- Jump to the implementation of the word under your cursor.
	--  Useful when your language has ways of declaring types without an actual implementation.
	map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

	-- Jump to the type of the word under your cursor.
	--  Useful when you're not sure what type a variable is and you want to see
	--  the definition of its *type*, not where it was *defined*.
	map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

	-- Fuzzy find all the symbols in your current document.
	--  Symbols are things like variables, functions, types, etc.
	map("<leader>sS", require("telescope.builtin").lsp_document_symbols, "[s]earch [S]ymbols Workspace")

	map("<leader>ss", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[s]earch [s]ymbols")

	-- Rename the variable under your cursor.
	--  Most Language Servers support renaming across files, etc.
	map("<leader>cn", vim.lsp.buf.rename, "[c]ode [r]ename")

	-- Execute a code action, usually your cursor needs to be on top of an error
	-- or a suggestion from your LSP for this to activate.
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	-- Opens a popup that displays documentation about the word under your cursor
	--  See `:help K` for why this keymap.
	map("<C-d>", vim.lsp.buf.hover, "Hover Documentation")

	-- WARN: This is not Goto Definition, this is Goto Declaration.
	--  For example, in C this would take you to the header.
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	-- The following autocommand is used to enable inlay hints in your
	-- code, if the language server you are using supports them
	--
	-- This may be unwanted, since they displace some of your code
	if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
		map("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "[T]oggle Inlay [H]ints")
	end
end

M.neoTestKeys = function()
	return {
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "[t]est [s]ummary",
			mode = { "n" },
		},
		{
			"<leader>tn",
			function()
				require("neotest").run.run()
			end,
			desc = "[t]est [n]earest",
			mode = { "n" },
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "[t]est [f]ile",
			mode = { "n" },
		},
		{
			"<leader>tx",
			function()
				require("neotest").run.stop()
			end,
			desc = "[t]est [s]top",
			mode = { "n" },
		},
	}
end

M.obsidianKeys = function()
	return {
		{
			"<leader>na",
			function()
				return require("obsidian").util.smart_action()
			end,
			mode = { "n" },
			desc = "[N]ote [A]ction, either follow link or toggle checkbox",
		},
		{
			"<leader>nc",
			"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
			desc = "Obsidian Check Checkbox",
			mode = "n",
		},
		{ "<leader>nd", mode = "n", "<cmd>ObsidianDailies<CR>", desc = "Obsidian Dailies" },
		{ "<leader>nt", mode = "n", "<cmd>ObsidianTemplate<CR>", desc = "Insert Obsidian Template" },
		{ "<leader>no", mode = "n", "<cmd>ObsidianOpen<CR>", desc = "Open in Obsidian App" },
		{ "<leader>nb", mode = "n", "<cmd>ObsidianBacklinks<CR>", desc = "Show ObsidianBacklinks" },
		{ "<leader>nl", mode = "n", "<cmd>ObsidianLinks<CR>", desc = "Show ObsidianLinks" },
		{ "<leader>nn", mode = "n", "<cmd>ObsidianNew<CR>", desc = "Create New Note" },
		{ "<leader>ns", mode = "n", "<cmd>ObsidianSearch<CR>", desc = "Search Obsidian" },
		{ "<leader>nq", mode = "n", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
	}
end

return M

-- vim: ts=2 sts=2 sw=2 et
