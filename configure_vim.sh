#! /usr/bin/env bash

# Install VIM plugins
# using https://github.com/agmaverick/dotfiles

set -e

# Coloring output messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

print_warning () {
	printf "${RED}WARNING: $1 ${NC}\n"
}

print_info () {
	printf "${YELLOW}INFO: $1 ${NC}\n"
}

print_success () {
	printf "${GREEN}$1 ${NC}\n"
}

ask_confirmation (){
    # From https://stackoverflow.com/questions/3231804/in-bash-how-to-add-are-you-sure-y-n-to-any-command-or-alias
    read -r -p "Do you want to continue? [y/N] " RESPONSE
    case "$RESPONSE" in
        [yY][eE][sS]|[yY]) 
            CONFIRMATION="yes"
            ;;
        *)
            CONFIRMATION="no"
            ;;
    esac    
}

TIMESTAMP=$(date +%s)

# Validate if .vim dir or .vimrc file exist
if [ -f $HOME/.vimrc ];
then
	print_warning ".vimrc file already exists!"
	ask_confirmation

	if [ $CONFIRMATION = "yes" ];
	then
		if [ -d $HOME/.vim ];
		then
			mv $HOME/.vim /tmp/"vim_bak-${TIMESTAMP}"
			print_info "Existing .vim directory has been moved to /tmp/vim_bak-${TIMESTAMP}"
		    mv $HOME/.vimrc /tmp/"vimrc_bak-${TIMESTAMP}"
			print_info "Existing .vimrc file has been moved to /tmp/vimrc_bak-${TIMESTAMP}"
		else
			mv $HOME/.vimrc /tmp/"vimrc_bak-${TIMESTAMP}"
			print_info "Existing .vimrc file has been moved to /tmp/vimrc_bak-${TIMESTAMP}"
		fi
     	else
		exit 1	
	fi				
fi

echo "Cloning dotfiles repository..."
DIR_NAME="dotfiles-${TIMESTAMP}"
git clone --recursive https://github.com/AGmaverick/dotfiles.git $HOME/$DIR_NAME

mv $HOME/$DIR_NAME/vim/vimrc $HOME/.vimrc
print_success "New .vimrc file placed in $HOME directory"

mv $HOME/$DIR_NAME/vim $HOME/.vim
print_success "New .vim folder placed in $HOME directory"

# Deleting dotfiles folder as it's not longer needed
if [ -d $HOME/.vim ] && [ -d $HOME/$DIR_NAME ]; 
then
        rm -rf $HOME/$DIR_NAME
        print_success "Done!"
fi

