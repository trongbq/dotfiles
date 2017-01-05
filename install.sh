# install tmux config file
cat tmux.conf > ~/.tmux.conf

# install gitconfig file
cat gitconfig > ~/.gitconfig

# install vim config
cat vimrc > ~/.vimrc

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/autoload

cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git

sudo apt-get install exuberant-ctags
cd ~/.vim/bundle
git clone git://github.com/majutsushi/tagbar

