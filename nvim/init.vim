if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

let s:cache_dir = $HOME . '/.cache/dein'
" Required:
if dein#load_state(s:cache_dir)

  " XDG base direcory compartible
  let g:dein#cache_directory = s:cache_dir

  " dein begin
  call dein#begin(s:cache_dir)

    " prepare toml file
    let s:toml_dir  = $HOME . '/vim_setup/toml' 
    let s:toml      = s:toml_dir . '/dein.toml'
    let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  
    " cache configure tomls
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

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

" color config
set background=dark
colorscheme apprentice

" keymap
noremap dt diffthis
noremap do diffoff
inoremap <silent> jj <ESC>
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
nmap <C-S> :source ~/.config/nvim/init.vim<CR>
tnoremap <silent> <ESC> <C-\><C-n>
