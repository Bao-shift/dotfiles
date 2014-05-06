" vim:fdm=marker

" TODO: Organize this! {{{
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set cmdheight=1
set clipboard+=unnamed
set cursorline
set encoding=utf-8
set gcr=a:blinkon0
set gdefault
set hidden
set history=1000
set nohlsearch
set ignorecase
set iskeyword-=_
set laststatus=2
set list
set listchars=tab:▸\ ,eol:¬
set mat=5
set mouse=a
set nobackup
set noerrorbells
set noswapfile
set nowrap
set nowb
set relativenumber
set number
set ruler
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set shiftround
set showcmd
set showbreak=↪
set showmatch
set showmode
set smartcase
set smartindent
set so=10
set textwidth=80
set t_Co=256
set virtualedit=block
set visualbell

augroup FastEscape
	autocmd!
	au InsertEnter * set timeoutlen=0
	au InsertLeave * set timeoutlen=1000
augroup END

" }}}
" Undo {{{

set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
set undofile

" }}}
" Wild completion {{{

set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" }}}
" Tabs {{{

set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

" }}}
" Color scheme {{{

let base16colorspace=256
colorscheme base16-default

" }}}
" Whitespace {{{

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
augroup ExtraWhitespaceCommand
  autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
  autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
augroup END

" }}}
" The Silver Searcher {{{

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Create SilverSearcher :Ag command
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" }}}
" Filetypes Autocommands {{{

" Sass Filetype for .scss and .sass extensions
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd BufNewFile,BufRead *.sass set filetype=sass

" }}}
