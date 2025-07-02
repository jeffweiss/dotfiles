#!/bin/bash

#
repo_dir=$HOME/.dotfiles

# create local dir for applications
mkdir -p $HOME/.local/bin $HOME/.local/share $HOME/.local/lib

# set up oh-my-zsh rc and theme
ln -sf $repo_dir/zsh/.zshrc $HOME/
ln -sf $repo_dir/zsh/jeffweiss.zsh-theme $HOME/.oh-my-zsh/themes/

# set up tmux config
ln -sf $repo_dir/tmux/.tmux.conf $HOME/

# set up vim config
ln -sf $repo_dir/vim/.vimrc $HOME/
mkdir -p $HOME/.vim/bundle
if [[ -z $HOME/.vim/bundle/Vundle.vim ]];  then
  git -C $HOME/.vim/bundle clone https://github.com/gmarik/Vundle.vim
fi

# set up neovim config

mkdir -p $HOME/.config/nvim/plugin
ln -sf $repo_dir/nvim/init.lua $HOME/.config/nvim/
ln -sf $repo_dir/nvim/plugin/floaterminal.lua $HOME/.config/nvim/plugin/
