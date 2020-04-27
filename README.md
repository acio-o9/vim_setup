# Vim(NeoVim) setup

## for neovim

```
mkdir -p ~/.config/nvim
ln -fns ~/vim_setup/nvim/init.vim ~/.config/nvim/init.vim
```

## for vim (by dein)

```
mkdir -p ~/.vim/bundle
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.vim/bundle

ln -s ~/vim_setup/dein/.vimrc ~/.vimrc
```

# coc note

## enable lsp

- PHP `:CocInstall coc-phpls`
- Python `:CocInstall coc-python`
- javascript `:CocInstall coc-tsserver`

### statement

- `*` activated
- `+` loaded
- `-` disabled

### service state

`:checkhealth`

## tsserver install failed

`:CocRestart`

something like this

```
Error on install coc-tsserver: Error: coc-tsserver 1.5.1 requires coc.nvim >= >=0.0.78, please update coc.nvim.
```
