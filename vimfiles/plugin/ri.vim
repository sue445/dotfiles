" Vim script to integrate ri Ruby documentation lookup with Vim
" Maintainer:	Daniel Choi <dhchoi@gmail.com>
" License: MIT License (c) 2011 Daniel Choi

if exists("g:RIVimLoaded") || &cp || version < 700
  finish
endif
let g:ri_vim_tool = 'ri_vim '
source /Users/sueyoshi_go/.rvm/gems/ruby-1.9.3-p194/gems/ri_vim-0.1.9/lib/ri.vim

