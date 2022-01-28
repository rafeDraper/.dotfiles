"----------------------------------
" Undotree
"----------------------------------
Plug 'mbbill/undotree'

if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif
"----------------------------------
" Remmaps
"----------------------------------

nnoremap <F6> :UndotreeToggle<CR>
"nnoremap <leader>u :UndotreeShow<CR>
