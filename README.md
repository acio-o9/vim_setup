# Vim の設定

## neobundle を利用する場合

    ln -s ~/vim_setup/neobudle/.vimrc ~/.vimrc

## dein を利用する場合

    mkdir -p ~/.vim/bundle
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh installer.sh ~/.vim/bundle

    ln -s ~/vim_setup/dein/.vimrc ~/.vimrc

