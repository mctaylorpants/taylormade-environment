set -e

echo "Installing neovim..."
sudo apt update && sudo apt install neovim

echo "Installing and configuring Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall

echo "Symlinking dotfiles..."
ln -fs .config/nvim/init.vim ~/.config/nvim/init.vm
ln -fs .zshrc ~/.zshrc
ln -fs .gitconfig ~/.gitconfig

echo "Done! 🎉"


