-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
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

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separatorsicons_enabled = true,
    theme = 'catppuccin',
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
    component_separators = "",
    section_separators = "",
    -- theme = {
    -- 	-- We are going to use lualine_c an lualine_x as left and
    -- 	-- right section. Both are highlighted by c theme .  So we
    -- 	-- are just setting default looks o statusline
    -- 	normal = { c = { fg = nord.black, bg = nord.dark_gray } },
    -- 	inactive = { c = { fg = nord.darkest_white, bg = nord.dark_gray } },
    -- },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    return "▊"
  end,
  color = { fg = nord.purple }, -- Sets highlighting of component
  padding = { left = 0, right = 5 }, -- We don't need space before this
})

ins_left({
  -- mode component
  function()
    return ""
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = nord.green,
      i = nord.blue,
      v = nord.purple,
      [""] = nord.blue,
      V = nord.blue,
      c = nord.purple,
      no = nord.red,
      s = nord.orange,
      S = nord.orange,
      [""] = nord.orange,
      ic = nord.yellow,
      R = nord.purple,
      Rv = nord.purple,
      cv = nord.red,
      ce = nord.red,
      r = nord.off_blue,
      rm = nord.off_blue,
      ["r?"] = nord.teal,
      ["!"] = nord.teal,
      t = nord.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
})

ins_left({
  -- filesize component
  "filesize",
  cond = conditions.buffer_not_empty,
  color = { fg = nord.white, gui = "bold" },
})

ins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = nord.red, gui = "bold" },
})

ins_left({ "progress", color = { fg = nord.green, gui = "bold" } })

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = nord.red },
    color_warn = { fg = nord.yellow },
    color_info = { fg = nord.off_blue },
  },
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
  function()
    return "%="
  end,
})

ins_left({
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
  color = { fg = nord.green, gui = "bold" },
})

-- Add components to right sections
ins_right({
  "o:encoding", -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = nord.off_blue, gui = "bold" },
})

ins_right({
  "fileformat",
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = nord.green, gui = "bold" },
})

ins_right({
  "branch",
  icon = "",
  color = { fg = nord.purple, gui = "bold" },
})

ins_right({
  "diff",
  -- Is it me or the symbol for modified us really weird
  symbols = { added = " ", modified = "柳 ", removed = " " },
  diff_color = {
    added = { fg = nord.green },
    modified = { fg = nord.orange },
    removed = { fg = nord.red },
  },
  cond = conditions.hide_in_width,
})

ins_right({
  function()
    return "▊"
  end,
  color = { fg = nord.purple },
  padding = { left = 1 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
