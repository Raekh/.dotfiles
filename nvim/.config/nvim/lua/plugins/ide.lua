return {
	"ldelossa/nvim-ide",
	config = function()
		local bufferlist = require("ide.components.bufferlist")
		local explorer = require("ide.components.explorer")
		local outline = require("ide.components.outline")
		local callhierarchy = require("ide.components.callhierarchy")
		local timeline = require("ide.components.timeline")
		local terminal = require("ide.components.terminal")
		local terminalbrowser = require("ide.components.terminal.terminalbrowser")
		local changes = require("ide.components.changes")
		local commits = require("ide.components.commits")
		local branches = require("ide.components.branches")
		local bookmarks = require("ide.components.bookmarks")

		require("ide").setup({
			icon_set = "default",
			log_level = "info",
			panels = {
				left = "explorer",
				right = "git",
			},
			panel_groups = {
				explorer = { explorer.Name, outline.Name, bufferlist.Name },
				terminal = { terminalbrowser.Name, terminal.Name },
				git = { changes.Name, commits.Name, timeline.Name, branches.Name },
				bookmarks = { callhierarchy.Name, bookmarks.Name },
			},
			workspaces = {
				auto_open = "both",
			},
		})
	end,
}
