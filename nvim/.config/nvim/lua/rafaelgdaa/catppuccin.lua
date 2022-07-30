local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
return
end

-- configure it
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

catppuccin.setup()

vim.cmd [[colorscheme catppuccin]]
