set path+=**

call plug#begin('~/.vim/plugged')

source ~/.dotfiles/nvim/.config/nvim/plugin/nvim-lspconfig.vim
source ~/.dotfiles/nvim/.config/nvim/plugin/nvim-lspsaga.vim
source ~/.dotfiles/nvim/.config/nvim/plugin/nvim-symbols-outline.vim
source ~/.dotfiles/nvim/.config/nvim/plugin/nvim-telescope.vim
source ~/.dotfiles/nvim/.config/nvim/plugin/nvim-neoformat.vim
source ~/.dotfiles/nvim/.config/nvim/plugin/nvim-nerdtree.vim
source ~/.dotfiles/nvim/.config/nvim/plugin/nvim-treesitter.vim
source ~/.dotfiles/nvim/.config/nvim/plugin/nvim-vim-airline.vim
source ~/.dotfiles/nvim/.config/nvim/plugin/nvim-snippets.vim
source ~/.dotfiles/nvim/.config/nvim/plugin/nvim-vim-fugitive.vim

Plug 'darrikonn/vim-gofmt'
Plug 'arcticicestudio/nord-vim'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'Yggdroot/indentLine'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'tpope/vim-projectionist'
Plug 'tomlion/vim-solidity'
Plug 'ThePrimeagen/git-worktree.nvim'

call plug#end()

" Theme color:
colorscheme onenord

lua require("rafaelgdaa")

" -------------------------------
" Key maps
" -------------------------------

" Mapleader:
let mapleader = " "


let g:webdevicons_enable = 1
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

map gf :edit <cfile><cr>
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

nnoremap <silent> Q <nop>
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

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
nnoremap <leader>Y gg"+yG
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

xnoremap <leader>p "_dP
nnoremap <leader>ä "*p
nnoremap <leader>ö "*y

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

augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

augroup RAFA
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup end
