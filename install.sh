NVIM_TARGET=$HOME/.config/nvim
[[ ! -L "${NVIM_TARGET}" ]] && ln -s $HOME/dotfiles/nvim/ ${NVIM_TARGET}

SOURCE_BASHRC="source ~/dotfiles/bash/bashrc" 

[[ ! -f ~/.bashrc ]] && touch ~/.bashrc

grep -q "${SOURCE_BASHRC}" ~/.bashrc
if [[ "$?" == "0" ]]; then
	echo "dotfiles bashrc already installed"
else
	echo "Upgrayedd-ing ;-)"
	echo ${SOURCE_BASHRC} >> ~/.bashrc
fi
