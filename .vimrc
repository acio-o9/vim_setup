"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/maru/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/maru/.vim/bundles')

" Let dein manage dein
" Required:
call dein#add('/Users/maru/.vim/bundles/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('prabirshrestha/vim-lsp')
call dein#add('mattn/vim-lsp-settings')
call dein#add('mattn/vim-lsp-icons')

call dein#add('prabirshrestha/asyncomplete.vim')
call dein#add('prabirshrestha/asyncomplete-lsp.vim')

call dein#add('hrsh7th/vim-vsnip')
call dein#add('hrsh7th/vim-vsnip-integ')

" ctrlp
call dein#add('ctrlpvim/ctrlp.vim')

" snippets
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

" grep with silver-searcher
call dein#add('rking/ag.vim')

" filer
call dein#add('preservim/nerdtree')

" spell check
call dein#add('kamykn/spelunker.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

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
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-n> <Left>
inoremap <C-l> <Right>
tnoremap <silent> <ESC> <C-\><C-n>
set backspace=indent,eol,start

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:python3_host_prog = '/Users/maru/.pyenv/versions/3.7.8/bin/python3'

" vim-lspの各種オプション設定
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1

let s:pyls_path = fnamemodify(g:python3_host_prog, ':h') . '/'. 'pyls'

" vim-lsp
if (executable('pyls'))
    " pylsの起動定義
    augroup LspPython
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': { server_info -> [expand(s:pyls_path)] },
      \ 'whitelist': ['python'],
      \ 'workspace_config': {'pyls': {'plugins': {
      \   'pycodestyle': {'enabled': v:true},
      \   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
      \ })
    augroup END
endif

nnoremap <C-]> :<C-u>LspDefinition<CR>
nnoremap K :<C-u>LspHover<CR>
nnoremap <LocalLeader>R :<C-u>LspRename<CR>
nnoremap <LocalLeader>r :<C-u>LspReferences<CR>
nnoremap <LocalLeader>d :<C-u>LspDocumentDiagnostics<CR>
nnoremap <LocalLeader>f :<C-u>LspDocumentFormat<CR>
set omnifunc=lsp#complete

let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
let g:asyncomplete_auto_completeopt=0

" asyncomplete.vim
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 750
let g:lsp_text_edit_enabled = 1

" disable auto complete
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

" ctrlp setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:lsp_settings = {
\   'pyls-all': {
\     'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}

" snipets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
