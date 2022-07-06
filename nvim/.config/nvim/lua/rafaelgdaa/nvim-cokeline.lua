local status_ok, cokeline = pcall(require, "cokeline")
if not status_ok then
	return
end

local cp_api = require("catppuccin.api.colors")
local get_hex = require("cokeline/utils").get_hex
local mappings = require("cokeline/mappings")

local comments_fg = get_hex("Comment", "fg")

local nord = {
	--16 colors
	black = "#2E3440", -- nord0 in palette
	dark_gray = "#3B4252", -- nord1 in palette
	gray = "#434C5E", -- nord2 in palette
	light_gray = "#4C566A", -- nord3 in palette
	light_gray_bright = "#616E88", -- out of palette
	darkest_white = "#D8DEE9", -- nord4 in palette
	darker_white = "#E5E9F0", -- nord5 in palette
	white = "#ECEFF4", -- nord6 in palette
	teal = "#8FBCBB", -- nord7 in palette
	off_blue = "#88C0D0", -- nord8 in palette
	glacier = "#81A1C1", -- nord9 in palette
	blue = "#5E81AC", -- nord10 in palette
	red = "#BF616A", -- nord11 in palette
	orange = "#D08770", -- nord12 in palette
	yellow = "#EBCB8B", -- nord13 in palette
	green = "#A3BE8C", -- nord14 in palette
	purple = "#B48EAD", -- nord15 in palette
	none = "NONE",
}
local components = {
	space = {
		text = " ",
		truncation = { priority = 1 },
	},

	two_spaces = {
		text = "  ",
		truncation = { priority = 1 },
	},

	separator = {
		text = function(buffer)
			return buffer.index ~= 1 and "▏" or ""
		end,
		truncation = { priority = 1 },
	},

	devicon = {
		text = function(buffer)
			return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
				or buffer.devicon.icon
		end,
		fg = function(buffer)
			return (mappings.is_picking_focus() and nord.purple)
				or (mappings.is_picking_close() and nord.red)
				or buffer.devicon.color
		end,
		style = function(_)
			return (mappings.is_picking_focus() or mappings.is_picking_close()) and "italic,bold" or nil
		end,
		truncation = { priority = 1 },
	},

	index = {
		text = function(buffer)
			return buffer.index .. ": "
		end,
		truncation = { priority = 1 },
	},

	unique_prefix = {
		text = function(buffer)
			return buffer.unique_prefix
		end,
		fg = comments_fg,
		style = "italic",
		truncation = {
			priority = 3,
			direction = "left",
		},
	},

	filename = {
		text = function(buffer)
			return buffer.filename
		end,
		style = function(buffer)
			return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold,underline")
				or (buffer.is_focused and "bold,italic")
				or (buffer.diagnostics.errors ~= 0 and "underline")
				or nil
		end,
		truncation = {
			priority = 2,
			direction = "left",
		},
	},

	diagnostics = {
		text = function(buffer)
			return (buffer.diagnostics.errors ~= 0 and "  " .. buffer.diagnostics.errors)
				or (buffer.diagnostics.warnings ~= 0 and "  " .. buffer.diagnostics.warnings)
				or ""
		end,
		fg = function(buffer)
			return (buffer.diagnostics.errors ~= 0 and nord.red)
				or (buffer.diagnostics.warnings ~= 0 and nord.orange)
				or nil
		end,
		truncation = { priority = 1 },
	},

	close_or_unsaved = {
		text = function(buffer)
			return buffer.is_modified and "●" or ""
		end,
		fg = function(buffer)
			return buffer.is_modified and nord.red or nil
		end,
		delete_buffer_on_left_click = true,
		truncation = { priority = 1 },
	},
}

cokeline.setup({
	-- Only show the bufferline when there are at least this many visible buffers.
	-- default: `1`.
	show_if_buffers_are_at_least = 1,

	buffers = {
		-- A function to filter out unwanted buffers. Takes a buffer table as a
		-- parameter (see the following section for more infos) and has to return
		-- either `true` or `false`.
		-- default: `false`.
		filter_valid = false,

		-- A looser version of `filter_valid`, use this function if you still
		-- want the `cokeline-{switch,focus}-{prev,next}` mappings to work for
		-- these buffers without displaying them in your bufferline.
		-- default: `false`.
		filter_visible = false,

		-- Which buffer to focus when a buffer is deleted, `prev` focuses the
		-- buffer to the left of the deleted one while `next` focuses the one the
		-- right. Turned off by default.
		-- default: `false`
		focus_on_delete = "next",

		-- If set to `last` new buffers are added to the end of the bufferline,
		-- if `next` they are added next to the current buffer.
		-- default: 'last',
		new_buffers_position = "last",
	},

	mappings = {
		-- Controls what happens when the first (last) buffer is focused and you
		-- try to focus/switch the previous (next) buffer. If `true` the last
		-- (first) buffers gets focused/switched, if `false` nothing happens.
		-- default: `true`.
		cycle_prev_next = true,
	},

	rendering = {
		-- The maximum number of characters a rendered buffer is allowed to take
		-- up. The buffer will be truncated if its width is bigger than this
		-- value.
		-- default: `999`.
		max_buffer_width = 49,
	},

	-- The default highlight group values.
	-- The `fg` and `bg` keys are either colors in hexadecimal format or
	-- functions taking a `buffer` parameter and returning a color in
	-- hexadecimal format. Similarly, the `style` key is either a string
	-- containing a comma separated list of items in `:h attr-list` or a
	-- function returning one.
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and nord.purple or nord.light_gray_bright
		end,
		bg = nord.dark_gray,
	},

	-- A list of components to be rendered for each buffer. Check out the section
	-- below explaining what this value can be set to.
	-- default: see `/lua/cokeline/defaults.lua`
	components = {
		components.space,
		components.separator,
		components.space,
		components.devicon,
		components.space,
		components.index,
		components.unique_prefix,
		components.filename,
		components.diagnostics,
		components.two_spaces,
		components.close_or_unsaved,
		components.space,
	},

	-- Left sidebar to integrate nicely with file explorer plugins.
	-- This is a table containing a `filetype` key and a list of `components` to
	-- be rendered in the sidebar.
	-- The last component will be automatically space padded if necessary
	-- to ensure the sidebar and the window below it have the same width.
	sidebar = {
		filetype = "NvimTree",
		components = {
			{
				text = "  ---NVIMTREE---",
				fg = nord.purple,
				bg = get_hex("NvimTreeNormal", "bg"),
				style = "bold",
			},
		},
	},
})
