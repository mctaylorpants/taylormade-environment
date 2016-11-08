rm ~/Library/Preferences/com.googlecode.iterm2.plist 2> /dev/null
rm ~/.zshrc 2> /dev/null
rm ~/.vimrc 2> /dev/null
rm ~/.gitconfig 2> /dev/null
rm ~/.gitignore_global 2> /dev/null

ln -s ~/code/taylormade-environment/Library/Preferences/com.googlecode.iterm2.plist ~/Library/Preferences/
ln -s ~/code/taylormade-environment/.vimrc ~/
ln -s ~/code/taylormade-environment/.zshrc ~/
ln -s ~/code/taylormade-environment/.gitconfig ~/
ln -s ~/code/taylormade-environment/.gitignore_global ~/
ln -s ~/.vim ~/.config/nvim
ln -s ~/code/taylormade-environment/vimrc ~/.config/nvim/init.vim

