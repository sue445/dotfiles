"""""""""""""""""""""""""""""""""
" Setup for NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'AutoComplPop'
NeoBundle 'matchit.zip'
NeoBundle 'mattn/benchvimrc-vim', {'type__protocol' : 'ssh' }
NeoBundle 'mattn/unite-outline', {'type__protocol' : 'ssh' }
NeoBundle 'nathanaelkane/vim-indent-guides', {'type__protocol' : 'ssh' }
NeoBundle 'othree/eregex.vim', {'type__protocol' : 'ssh' }
NeoBundle 'scrooloose/nerdcommenter', {'type__protocol' : 'ssh' }
NeoBundle 'scrooloose/nerdtree', {'type__protocol' : 'ssh' }
NeoBundle 'tpope/vim-endwise', {'type__protocol' : 'ssh' }
"NeoBundle 'tpope/vim-pathogen'
NeoBundle 'vim-scripts/AnsiEsc.vim', {'type__protocol' : 'ssh' }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"NeoBundleCheck
"""""""""""""""""""""""""""""""""

set nocompatible

autocmd!
filetype plugin indent on

" <leader> を ¥キー だけでいけるようにする
" ref. http://amatsukikuu.blogspot.jp/2012/01/macvim.html
map ¥ <leader>

"<C-Space>でomni補完
imap <C-Space> <C-x><C-o>

" 括弧の後ろを自動で補完する
" ref. http://d.hatena.ne.jp/babie/20110130/1296348203
inoremap ( ()<ESC>i
inoremap <expr> ) ClosePair(')')
inoremap < <><ESC>i
inoremap <expr> > ClosePair('>')
inoremap { {}<ESC>i
inoremap <expr> } ClosePair('}')
inoremap [ []<ESC>i
inoremap <expr> ] ClosePair(']')
" pair close checker.
" from othree vimrc ( http://github.com/othree/rc/blob/master/osx/.vimrc )
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

" 引数なしでvimを開いたらNERDTreeを起動、引数ありならNERDTreeは起動しない
" ref. http://kokukuma.blogspot.jp/2011/12/vim-essential-plugin-nerdtree.html
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * NERDTree ./
endif

nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

" for nerdcommenter
" コメントした後に挿入するスペースの数
let NERDSpaceDelims = 1
" キーマップの変更。<Leader>=\+cでコメント化と解除を行う。
" コメントされていれば、コメントを外し、コメントされてなければコメント化する。
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

" タブはスペース2つでインデントする
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set cindent
set list

" スペースなどの見えない文字の表示方法を変える
" ref. http://d.hatena.ne.jp/potappo2/20061107/1162862536
set listchars=tab:>-,nbsp:%,extends:>,precedes:<

" Vimで行末の空白を保存時に自動削除する
" ref. http://blog.toshimaru.net/vim
autocmd BufWritePre * :%s/\s\+$//e

" インデントをわかりやすくする
" ref. http://wd.layer13.com/2011/12/03/T16-04-34/Vim%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%B3%E3%83%88%E3%82%92%E3%82%8F%E3%81%8B%E3%82%8A%E3%82%84%E3%81%99%E3%81%8F%E8%A1%A8%E7%A4%BA%E3%81%99%E3%82%8B%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%80%82Indent%20Guides
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=235

" 自動読み込みを有効にするとgit commit --amendで警告が出るため無効化する
"let g:indent_guides_enable_on_vim_startup = 1

" 文字コードを自動判別する
" ref. http://d.hatena.ne.jp/over80/20080907/1220794834
set encoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213

filetype on
" syntax on
" colorscheme desert
