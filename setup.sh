echo "Installing neovim..."
sudo apt install neovim

echo "Installing and configuring Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall

echo "Symlinking dotfiles..."
ln -s .config/nvim/init.vim ~/.config/nvim/init.vm
ln -s .zshrc ~/.zshrc
ln -s .gitconfig ~/.gitconfig

echo "Done! 🎉"


