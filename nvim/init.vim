"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/maruc/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/maruc/.cache/dein')
    call dein#begin('/Users/maruc/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add('/Users/maruc/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/vimfiler.vim')
    call dein#add('kien/ctrlp.vim')
    call dein#add('tyru/caw.vim')
    call dein#add('soramugi/auto-ctags.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})

    call dein#add('Shougo/vimproc.vim', {
        \ 'build': {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin'  : 'make -f make_cygwin.mak',
        \     'mac'     : 'make -f make_mac.mak',
        \     'linux'   : 'make',
        \     'unix'    : 'gmake',
        \    },
        \ })

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

" vimfiler
let g:vimfiler_as_default_explorer = 1
noremap <C-T><C-T> :VimFiler -buffer-name=explorer -split -simple -toggle -winwidth=45 -no-quit<ENTER>

" basement
syntax on
set title
set nu
set cursorline
set ruler
set enc=utf-8
set ignorecase
set wrapscan
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set wildmenu
set clipboard+=unnamed

noremap dt diffthis
noremap do diffoff
inoremap <silent> jj <ESC>
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" color config
" colorscheme apprentice
set background=dark
colorscheme lucius

" comment
nmap <C-K> <Plug>(caw:hatpos:toggle)
vmap <C-K> <Plug>(caw:hatpos:toggle)

" ctags
" set tags+=~/tags
" let g:auto_ctags = 1
" let g:auto_ctags_directory_list = ['~/']

" use silver-searcher
if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
        \ '-f --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif


