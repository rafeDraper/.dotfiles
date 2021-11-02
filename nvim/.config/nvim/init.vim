set path+=**

call plug#begin('~/.vim/plugged')

" Completer config
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'mattn/emmet-vim'

" Telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Prettier
Plug 'sbdchd/neoformat'

" Neovim Tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'

" Git stuff:
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'

Plug 'darrikonn/vim-gofmt'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'tpope/vim-projectionist'
Plug 'tomlion/vim-solidity'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'itchyny/lightline.vim'

call plug#end()

" Theme color:
colorscheme nord

" Maps
let mapleader = " "


lua require("rafaelgdaa")

lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1
let g:user_emmet_settings = {
  \  'svelte' : {
  \    'extends' : 'html',
  \  },
  \}

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

let mapleader = " "

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

nnoremap <silent> Q <nop>
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
" Probably rename this, because its straight silly to be a worktree.
"nnoremap <leader>; :lua require("theprimeagen.git-worktree").execute(vim.loop.cwd(), "just-build")<CR>

nnoremap <leader>vwh :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>cpu a%" PRIu64 "<esc>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>gt <Plug>PlenaryTestFile
nnoremap <leader>vwm :lua require("vim-with-me").init()<CR>
nnoremap <leader>dwm :lua require("vim-with-me").disconnect()<CR>
nnoremap <leader>gll :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<CR>
nnoremap <leader>gln :cnext<CR>:call search(_search_term)<CR>
nnoremap <leader>glp :cprev<CR>:call search(_search_term)<CR>

nnoremap <leader>x :silent !chmod +x %<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <Leader>ww ofunction wait(ms: number): Promise<void> {<CR>return new Promise(res => setTimeout(res, ms));<CR>}<esc>k=i{<CR>

inoremap <C-c> <esc>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" ES
com! W w

nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup RAFA
    autocmd!
    autocmd BufWritePre lua,cpp,c,h,hpp,cxx,cc Neoformat
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
