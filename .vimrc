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

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_enable_camel_case_completion = 0
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

" vimfiler
let g:vimfiler_as_default_explorer = 1
noremap <C-X><C-T> :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>
inoremap <silent> jj <ESC>
autocmd VimEnter * VimFilerExplorer

"#####表示設定#####
colorscheme desert "/usr/share/vim/vim74/colors/下から選択
set number "行番号を表示する
set title "編集中のファイル名を表示 
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set enc=utf-8 "文字コード

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する 
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
