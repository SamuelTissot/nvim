return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
			{ "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
		config = function(_, opts)
			local chat = require("CopilotChat")
			chat.setup(opts)

			require("hels.core.keymaps").copilotChatKeys()
		end,
	},
}
