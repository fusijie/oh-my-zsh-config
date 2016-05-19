#!/usr/bin/env bash

read -p 'Are you sure to install .zshrc? (yes/no) ' choice

if [ $choice == 'yes' ]
then
	cp ./.zshrc ~/.zshrc
	echo 'install completed.'
else
	echo 'exit'
fi