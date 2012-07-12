set nocompatible
filetype off

if has("win32") || has("win64")
  set rtp+=~/vimfiles/vundle.git/ 
  call vundle#rc('~/vimfiles/bundle/')
else
  set rtp+=~/.vim/vundle.git/ 
  call vundle#rc()
endif

Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc' 
Bundle 'The-NERD-tree'
Bundle 'chrismetcalf/vim-taglist' 
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'h1mesuke/unite-outline'
Bundle 'matchit.zip'
Bundle 'mattn/benchvimrc-vim' 
Bundle 'mattn/mkdpreview-vim'
Bundle 'mattn/webapi-vim'
Bundle 'othree/eregex.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'skwp/vim-rspec.git'
Bundle 'taka84u9/vim-ref-ri'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive' 
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/AnsiEsc.vim' 
Bundle 'yuroyoro/monday'

filetype plugin indent on

" https://github.com/joker1007/dotfiles/blob/master/vimrc
" augroup init (from tyru's vimrc)
augroup vimrc
  autocmd!
augroup END

command!
\ -bang -nargs=*
\ MyAutocmd
\ autocmd<bang> vimrc <args>


"<C-Space>でomni補完
imap <C-Space> <C-x><C-o>

" Cmd+Shift+9
map <D-9> :RunSpec<cr>
" Cmd+Shift+0
map <D-9> :RunSpecLine<cr>
" :source $VIMRUNTIMEmacros/matchit.vim
:source ~/.vim/bundle/matchit.zip/plugin/matchit.vim
let g:ruby_refactoring_map_keys=1

" 括弧の後ろを自動で補完する
" http://d.hatena.ne.jp/babie/20110130/1296348203
inoremap ( ()<ESC>i
inoremap <expr> ) ClosePair(')')
inoremap < <><ESC>i
inoremap <expr> ) ClosePair('>')
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

" erbの閉じ括弧を補完する
" http://d.hatena.ne.jp/yamitzky/20111213/1323739808
inoremap <expr> % Lt_Percent_Completion()
function! Lt_Percent_Completion()
  if matchstr(getline('.'), '.', col('.') -1 ) == ">"
 	  return "\%\%\<Left>"
  else
 	  return "\%"
	end
endf

" 引数なしでvimを開いたらNERDTreeを起動、引数ありならNERDTreeは起動しない
" http://kokukuma.blogspot.jp/2011/12/vim-essential-plugin-nerdtree.html
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

" for RSpec TDD
" http://qiita.com/items/69035c454de416849b8a

" quickrunの出力結果にAnsiEscを実行して色付けする
MyAutocmd FileType quickrun AnsiEsc

" quickrunの実行モジュールをvimprocに設定する
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}

" rspecを実行するための設定を定義する
" %cはcommandに設定した値に置換される
" %oはcmdoptに設定した値に置換される
" %sはソースファイル名に置換される
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'outputter': 'buffered:target=buffer',
  \ 'exec': 'bundle exec %c %o --color --drb --tty %s'
  \}
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'outputter': 'buffered:target=buffer',
  \ 'exec': '%c %o --color --drb --tty %s'
  \}

" :QuickRunで実行されるコマンドをrspec用の定義に設定する
" <Leader>lrをタイプした時に、:QuickRun -cmdopt "-l (カーソル行)"を実行するキーマップを定義する ← これがポイント
function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
	" nnoremap <expr><silent> <Leader>lr "<Esc>:QuickRun -cmdopt \"-l " . line(".") . "\"<CR>"
	
	" Quick JUnitのようにCommand-0でテストを実行する
	nnoremap <expr><silent> <D-0> "<Esc>:QuickRun -cmdopt \"-l " . line(".") . "\"<CR>"
endfunction

" ファイル名が_spec.rbで終わるファイルを読み込んだ時に上記の設定を自動で読み込む
MyAutocmd BufReadPost *_spec.rb call RSpecQuickrun()

