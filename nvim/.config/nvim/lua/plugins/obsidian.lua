return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	-- Allow these commands to work from anywhere (Lazy will load obsidian.nvim on demand).
	cmd = {
		"ObsidianQuickSwitch",
		"ObsidianSearch",
		"ObsidianNew",
	},
	-- Lazy-load when entering markdown files in the vault (recommended by obsidian.nvim).
	-- Ref: https://github.com/epwalsh/obsidian.nvim
	event = {
		-- Use ** to match nested directories within the vault.
		"BufReadPre " .. vim.fn.expand("~") .. "/Documents/Notes/**/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Documents/Notes/**/*.md",
	},
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- Optional (recommended): for completion & pickers, if you already use them.
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "notes",
				path = vim.fn.expand("~/Documents/Notes"),
			},
		},

		-- Where new notes are created by default (e.g. via :ObsidianNew).
		-- Ref: https://github.com/epwalsh/obsidian.nvim
		notes_subdir = "All Notes",
		new_notes_location = "notes_subdir",

		-- Bring Obsidian.app to the foreground when running :ObsidianOpen.
		-- (Without this, obsidian.nvim uses `open ... --background ...` on macOS.)
		open_app_foreground = true,

		-- Make filenames derive from the note title instead of a timestamp/random suffix.
		-- Ref: https://github.com/epwalsh/obsidian.nvim
		note_id_func = function(title)
			if title ~= nil then
				-- Convert title to a reasonable filename slug.
				local slug = title:gsub("^%s+", ""):gsub("%s+$", "")
				slug = slug:gsub("%s+", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				if slug ~= "" then
					return slug
				end
			end
			-- Fallback when title is nil/empty.
			return tostring(os.time())
		end,

		-- Avoid overwriting if a note with the same title already exists.
		note_path_func = function(spec)
			local uv = vim.uv or vim.loop
			local base = tostring(spec.id)
			local path = (spec.dir / base):with_suffix(".md")

			local i = 2
			while uv.fs_stat(tostring(path)) do
				path = (spec.dir / (base .. "-" .. i)):with_suffix(".md")
				i = i + 1
			end

			return path
		end,

		-- Use Telescope for pickers (QuickSwitch/Search/Backlinks/Tags/etc).
		-- Ref: https://github.com/epwalsh/obsidian.nvim
		picker = {
			name = "telescope.nvim",
		},

		-- Open URLs under cursor when following links (e.g. via `gf`).
		-- Ref: https://github.com/epwalsh/obsidian.nvim
		follow_url_func = function(url)
			vim.fn.jobstart({ "open", url }) -- macOS
		end,

		-- Don't let obsidian.nvim manage YAML frontmatter (id/aliases/tags/etc).
		-- Ref: https://github.com/epwalsh/obsidian.nvim
		disable_frontmatter = true,

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		-- Note: obsidian.nvim registers itself as an nvim-cmp source automatically inside your vault.
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},

		-- see below for full list of options 👇
	},
}
