#!/bin/bash

#
repo_dir=$HOME/.dotfiles

# set up oh-my-zsh rc and theme
ln -sf $repo_dir/zsh/.zshrc $HOME/
ln -sf $repo_dir/zsh/jeffweiss.zsh-theme $HOME/.oh-my-zsh/themes/

# set up tmux config
ln -sf $repo_dir/tmux/.tmux.conf $HOME/

# set up vim config
ln -sf $repo_dir/vim/.vimrc $HOME/
mkdir -p $HOME/.vim/bundle
git -C $HOME/.vim/bundle clone https://github.com/gmarik/Vundle.vim
