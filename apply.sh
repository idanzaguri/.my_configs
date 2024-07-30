ln -s -r -f .vimrc ~/
ln -s -r -f .tmux/.tmux.conf ~/
ln -s -r -f .tmux ~/
ln -s -r -f .tmux.conf.local ~/
ln -s -r -f .gtkwaverc ~/
ln -s -r -f tmux-plugins ~/.tmux-plugins

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

