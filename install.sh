#!/bin/bash

CURRENT_DIR=`pwd`
cd $HOME

echo "Step1: backup current vim config"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc; do [ -L $i ] && unlink $i ; done

echo "Step2: setting up system links"
ln -s $CURRENT_DIR/.vimrc $HOME/.vimrc
ln -s "$CURRENT_DIR/.vim" "$HOME/.vim"
if [[ ! -e $HOME/.vim/tmp/backup ]]; then
  mkdir -p $HOME/.vim/tmp/backup
fi
if [[ ! -e $HOME/.vim/tmp/swap ]]; then
  mkdir -p $HOME/.vim/tmp/swap
fi
if [[ ! -e $HOME/.vim/tmp/undo ]]; then
  mkdir -p $HOME/.vim/tmp/undo
fi

echo "Step3: update/install plugins via Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Step4: compile plugins"
echo "======= ctrlp-cmathcer ======="
echo "https://github.com/JazzCore/ctrlp-cmatcher"
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
cd $HOME/.vim/bundle/ctrlp-cmatcher
./install.sh

echo "====== YouCompleteMe ======"
echo "if error, goto following link and compile yourself"
echo "https://github.com/Valloric/YouCompleteMe"
cd $HOME/.vim/bundle/YouCompleteMe
if [ `which npm` ]
then
  sudo npm install -g typescript
fi
python install.py --tern-completer

echo "Done!"
echo "manually install ag engine to speed up"
echo "brew install the_silver_searcher"
echo "brew install ack"
