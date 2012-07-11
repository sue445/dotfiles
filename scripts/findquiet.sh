#!/bin/bash

# usage ~/findquiet <path> <find-name> 
# ln -s ~/dotfiles/scripts/findquiet.sh ~/findquiet
find $1 -name $2 -print 2>/dev/null
