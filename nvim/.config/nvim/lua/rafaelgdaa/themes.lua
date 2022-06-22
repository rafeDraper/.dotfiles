vim.cmd "colorscheme default"

-- local colorscheme = "onenord"
local colorscheme = "nord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme" .. colorscheme .. " not found!")
  return
end

