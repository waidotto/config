set number
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set noexpandtab
if exists('&ambiwidth')
  set ambiwidth=double
endif
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,iso-2022-jp,cp932,latin1
"set foldmethod=indent
set clipboard=unnamed,autoselect
set textwidth=0
syntax on

if filereadable(expand('~/.vimrc.plugin'))
    source ~/.vimrc.plugin
endif

