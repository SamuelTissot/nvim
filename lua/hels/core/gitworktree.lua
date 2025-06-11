local Worktree = require("git-worktree")

-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

Worktree.on_tree_change(function(op, metadata)
	if op == Worktree.Operations.Create then
		-- transfer environments configurations
		local source = metadata.path .. "/../.wtenv"
		if vim.fn.isdirectory(source) ~= 0 then
			print("tranfering wtenv files")
			-- transfer the file
			local output = vim.fn.system({ "rsync", "-ru", source .. "/", metadata.path })
			print(output)
			-- run sed to set correct directory
			print("doing path work")
			output = vim.fn.system(
				"find " .. metadata.path .. " -type f -exec sed -i 's#{{WT_TARGET_DIR}}#" .. metadata.path .. "#g' {} +"
			)
			print(output)
		end
	end
end)
