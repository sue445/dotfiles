set nocompatible
filetype off

if has("win32") || has("win64")
  set rtp+=~/vimfiles/vundle.git/
  call vundle#rc('~/vimfiles/bundle/')
else
  set rtp+=~/.vim/vundle.git/
  call vundle#rc()
endif

Bundle 'AutoComplPop'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'chrismetcalf/vim-taglist'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'h1mesuke/unite-outline'
Bundle 'itchyny/calendar.vim'
Bundle 'matchit.zip'
Bundle 'mattn/benchvimrc-vim'
Bundle 'mattn/habatobi-vim'
Bundle 'mattn/mkdpreview-vim'
Bundle 'mattn/webapi-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'othree/eregex.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'skwp/vim-rspec.git'
Bundle 'scrooloose/nerdtree'
Bundle 'taka84u9/vim-ref-ri'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/AnsiEsc.vim'
Bundle 'yuroyoro/monday'

autocmd!
filetype plugin indent on

" <leader> を ¥キー だけでいけるようにする
" ref. http://amatsukikuu.blogspot.jp/2012/01/macvim.html
map ¥ <leader>

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

" erbの閉じ括弧を補完する
" ref. http://d.hatena.ne.jp/yamitzky/20111213/1323739808
inoremap <expr> % Lt_Percent_Completion()
function! Lt_Percent_Completion()
  if matchstr(getline('.'), '.', col('.') -1 ) == ">"
    return "\%\%\<Left>"
  else
    return "\%"
  end
endf

" xmlなどの閉じタグを自動補完する
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

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

" for RSpec TDD
" ref. http://qiita.com/items/69035c454de416849b8a

" quickrunの出力結果にAnsiEscを実行して色付けする
autocmd FileType quickrun AnsiEsc

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
  \ 'outputter': 'buffer',
  \ 'exec': 'bundle exec %c %o --color --drb --tty %s'
  \}
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'outputter': 'buffer',
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
autocmd BufReadPost *_spec.rb call RSpecQuickrun()

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
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=235

" 自動読み込みを有効にするとgit commit --amendで警告が出るため無効化する
"let g:indent_guides_enable_on_vim_startup = 1

" 文字コードを自動判別する
" ref. http://d.hatena.ne.jp/over80/20080907/1220794834
set encoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213

" vim-shellのショートカット
" ref. http://d.hatena.ne.jp/nauthiz/20101107/1289140518
" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>
" ,ipy: pythonを非同期で起動
nnoremap <silent> ,ipy :VimShellInteractive python<CR>
" ,irb: irbを非同期で起動
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" ,ss: 非同期で開いたインタプリタに現在の行を評価させる
vmap <silent> ,ss :VimShellSendString<CR>
" 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>

" ref. http://d.hatena.ne.jp/itchyny/20140108/1389164688
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

