local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local status_gps_ok, gps = pcall(require, "nvim-gps")
if not status_gps_ok then
	return
end

local icons = require("rafaelgdaa.icons")

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local mode_color = {
  n = "#569cd6",
  i = "#6a9955",
  v = "#c586c0",
  [""] = "#c586c0",
  V = "#c586c0",
  c = "#4EC9B0",
  no = "#569cd6",
  s = "#ce9178",
  S = "#ce9178",
  [""] = "#ce9178",
  ic = "#dcdcaa",
  R = "#d16969",
  Rv = "#d16969",
  cv = "#569cd6",
  ce = "#569cd6",
  r = "#d16969",
  rm = "#4EC9B0",
  ["r?"] = "#4EC9B0",
  ["!"] = "#4EC9B0",
  t = "#D7BA7D",
}

local mode = {
  -- mode component
  function()
    return "▊"
  end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_color[vim.fn.mode()] }
  end,
  -- padding = { right = 1 },
  padding = 0,
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
	cond = hide_in_width,
}

local filename = {
	"filename",
	file_status = true,
	path = 1,
}

local spaces = {
  function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  padding = 0,
  separator = "%#SLSeparator#" .. " │" .. "%*",
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local lsp = {
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { gui = "bold" },
}

local nvim_gps = function()
	local gps_location = gps.get_location()
	if gps_location == "error" then
		return ""
	else
		return gps.get_location()
	end
end

local progress = {
  "progress",
  color = "SLProgress",
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
		always_divide_middle = true,
    globalstatus = true
	},
	sections = {
		-- lualine_a = { branch, diagnostics },
		lualine_a = { mode, branch },
		lualine_b = { diagnostics },
		lualine_c = { filename, nvim_gps },
		-- lualine_c = {
		--   { nvim_gps, cond = gps.is_available },
		-- },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, location },
		lualine_y = { progress },
		lualine_z = { lsp },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
