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
	if op == Worktree.Operations.Switch then
		local hook = metadata.path .. "/../.gwthook.sh"
		if vim.fn.executable(hook) ~= 0 then
			print("triggering git worktree hook")
			local output = vim.fn.system({ hook, metadata.path })
			print(output)
		end
	end
end)
