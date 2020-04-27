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
