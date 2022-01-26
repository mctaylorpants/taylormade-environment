set -e
set -x

echo "🛠 dotfiles install. Running as '$(whoami)'"
echo "\$HOME = $HOME"

echo "Installing neovim..."
sudo apt-get -y update && sudo apt-get -y install neovim

echo "Installing and configuring Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# nvim +PluginInstall +qall

echo "Symlinking dotfiles..."
mkdir -p ~/.config/nvim
ln -fs .config/nvim/init.vim ~/.config/nvim/init.vm
ln -fs .zshrc ~/.zshrc
ln -fs .gitconfig ~/.gitconfig

echo "Done! 🎉"


