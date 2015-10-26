execute pathogen#infect()
syntax on
filetype plugin indent on


inoremap jj <Esc>
inoremap kk <Esc>

nnoremap <F5> :call Compile()<CR>
inoremap <F5> <Esc>:call Compile()<CR>

inoremap <C-W><C-W> <Esc><C-W><C-W>
inoremap <C-W> <Esc><C-W>

nnoremap <F3> :cprev<CR>
inoremap <F3> <Esc>:cprev<CR>

nnoremap <F4> :cnext<CR>
inoremap <F4> <Esc>:cnext<CR>

nnoremap <F9> :sh<CR>
inoremap <F9> <Esc>:sh<CR>

nnoremap <F12> "=strftime("%Y-%m-%d:%H%M-%Z")<CR>P
inoremap <F12> <C-R>=strftime("%Y-%m-%d:%H%M-%Z")<CR>

nnoremap [1;5P :call SetColorSolarized()<CR>
inoremap [1;5P <Esc>:call SetColorSolarized()<CR>i

nnoremap [1;5Q :call SetColorBlackboard()<CR>
inoremap [1;5Q <Esc>:call SetColorBlackboard()<CR>i

function! SetColorSolarized() 
  set t_Co=16
  set background=dark
  colorscheme solarized
endfunction

function! SetColorBlackboard() 
  set t_Co=16
  set background=dark
  colorscheme blackboard
endfunction

function! Compile()
  tabfirst
  cclose
  let cwd=getcwd()
  let build_dir="/home/robert/vim-build/" . matchlist(cwd, '\(/home/robert/src/\)\?\(.*\)')[2]
  echo build_dir
  let &makeprg='make -C ' . build_dir
  wa
  make
  cw
endfunction

set cc=80

" size of a hard tabstop
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nosmarttab

set exrc
set secure
