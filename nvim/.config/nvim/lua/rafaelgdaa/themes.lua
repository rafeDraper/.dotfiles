vim.cmd "colorscheme default"

-- local colorscheme = "onenord"
local colorscheme = "catppuccin"
-- local colorscheme = "moonlight"
-- NeotestFailed  xxx cleared
-- NeotestRunning xxx cleared
-- NeotestSkipped xxx cleared
-- NeotestTest    xxx links to Normal
-- NeotestNamespace xxx cleared
-- NeotestFocused xxx cleared
-- NeotestFile    xxx cleared
-- NeotestDir     xxx cleared
-- NeotestIndent  xxx cleared
-- NeotestExpandMarker xxx cleared
-- NeotestAdapterName xxx cleared
-- NeotestWinSelect xxx cleared
-- NeotestMarked  xxx cleared
-- NeotestTarget  xxx cleared
-- NeotestUnknown xxx links to Normal
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.highlight.create('NeotestPassed', {ctermbg=0, guifg="#A6E3A1"})
vim.highlight.create('NeotestFailed', {ctermbg=0, guifg="#F38BA8"})
vim.highlight.create('NeotestRunning', {ctermbg=0, guifg="#F9E2AF"})

if not status_ok then
  vim.notify("colorscheme" .. colorscheme .. " not found!")
  return
end

