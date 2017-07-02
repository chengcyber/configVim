#!/bin/bash

CURRENT_DIR=`pwd`
cd $HOME

echo "Step1: backup current vim config"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc; do [ -L $i ] && unlink $i ; done

echo "Step2: setting up system links"
lnif $CURRENT_DIR/vimrc $HOME/.vimrc
lnif "$CURRENT_DIR/.vim" "$HOME/.vim"
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
vim +PluginInstall!

echo "Step4: complie YouCompleteMe"
echo "if error, goto following link and compile yourself"
echo "https://github.com/Valloric/YouCompleteMe"
cd $HOME/.vim/bundle/YouCompleteMe
if [ `which npm` ]
then
  sudo npm install -g typescript
fi
python install.py --tern-completer

echo "Done!"
