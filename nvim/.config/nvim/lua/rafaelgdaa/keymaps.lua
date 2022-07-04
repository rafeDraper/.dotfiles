local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Save with "11"
keymap("n", "11", ":w<CR>", opts)
keymap("n", "12", ":wq<CR>", opts)
keymap("n", "13", ":q!<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- DAP
keymap("n", "<F4>", ":lua require('dapui').toggle()<CR>", opts)
keymap("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<F9>", ":lua require('dap').continue()<CR>", opts)

keymap("n", "<F1>", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<F2>", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<F3>", ":lua require('dap').step_out()<CR>", opts)

keymap("n", "<Leader>dsc", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<Leader>dso", ":lua require('dap').step_out()<CR>", opts)

keymap("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", opts)
keymap("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", opts)

keymap("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", opts)
keymap(
	"n",
	"<Leader>duf",
	":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>",
	opts
)

keymap("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", opts)
keymap("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", opts)

keymap("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap(
	"n",
	"<Leader>dbm",
	":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
	opts
)
keymap("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", opts)

keymap("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", opts)
keymap("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", opts)

-- Ultest

keymap("n", "<Leader>t1", "<cmd>lua require('neotest').run.run()<CR>", opts)
keymap("n", "<Leader>t2", "<cmd>lua require('neotest').output.open()<CR>", opts)
keymap("n", "<Leader>t3", "<cmd>lua require('neotest').summary.toggle()<CR>", opts)
keymap("n", "<Leader>t4", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)
keymap("n", "<Leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", opts)
keymap("n", "<Leader>ts", "<cmd>lua require('neotest').run.stop()<CR>", opts)
keymap("n", "<Leader>ta", "<cmd>lua require('neotest').run.atach()<CR>", opts)

-- Vim-Test

keymap("n", "<Leader>t", "<cmd>TestNearest<CR>", opts)
keymap("n", "<Leader>T", "<cmd>TestFile<CR>", opts)
keymap("n", "<Leader>a", "<cmd>TestSuite<CR>", opts)
keymap("n", "<Leader>l", "<cmd>TestLast<CR>", opts)
keymap("n", "<Leader>g", "<cmd>TestVisit<CR>", opts)

-- Telesccope
keymap("n", "<Leader>pd", "<cmd>lua require('rafaelgdaa.telescope').search_dotfiles()<CR>", opts)
keymap("n", "<Leader>pg", "<cmd>lua require('rafaelgdaa.telescope').git_branches()<CR>", opts)
keymap("n", "<Leader>pf", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>", opts)
keymap("n", "<Leader>ph", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)

-- Lazygit
keymap("n", "<Leader>lg", "<cmd>LazyGit<CR>", opts)

-- Null-ls formating key
keymap("n", "<Leader>fd", "<cmd>Format<CR>", opts)

-- Which key
keymap("n", "<Leader>k", "<cmd>Which<CR>", opts)

-- Nvim-Tree key
keymap("n", "<Leader>tt", "<cmd>NvimTreeToggle<CR>", opts)

-- Custom
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
keymap("n", "<TAB>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
keymap("n", "<C-s>", "<cmd>vsplit<cr>", opts)
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
keymap("n", "<c-n>", ":e ~/Notes/<cr>", opts)
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- keymap("n", "<F1>", ":e ~/Notes/<cr>", opts)
-- keymap("n", "<F3>", ":e .<cr>", opts)
-- keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
-- keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
-- keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
-- keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", opts)
-- keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
