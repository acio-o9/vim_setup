filetype off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'thinca/vim-ref'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'violetyk/neocomplete-php.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bronson/vim-trailing-whitespace'

" lightline
NeoBundle 'itchyny/lightline.vim'

" snippet
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_enable_camel_case_completion = -3
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

" vimfiler
let g:vimfiler_as_default_explorer = 1
noremap <C-X><C-T> :VimFiler -split -simple -winwidth=30 -no-quit <ENTER>
inoremap <silent> jj <ESC>
inoremap <C-H> <BS>
"autocmd VimEnter * vimFilerExplorer

" vim-indent
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
let g:indent_guides_guide_size = 1

"snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neocomplcache_snippets_dir='~/.vim/bundle/vim-snippets/snippets'


"neocomplete-php
let g:neocomplete_php_locale = 'ja'
"ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

"#####表示設定#####
set background=dark
colorscheme molokai 
set number "行番号を表示する
set title "編集中のファイル名を表示 
set laststatus=2 "常にステータス行を表示
set cmdheight=2 "コマンドをステータスに表示
set backspace=indent,eol,start
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=2 "インデントをスペース2つ分に設定
set shiftwidth=2
set autoindent
set expandtab
set smartindent "オートインデント
set enc=utf-8 "文字コード
set textwidth=4
set clipboard=unnamed,autoselect


"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する 
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

set tags=~/tags

