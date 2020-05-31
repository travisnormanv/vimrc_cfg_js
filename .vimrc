" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" max column settings
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERDtree
Plugin 'preservim/nerdtree'

" YouCompleteMe
Plugin 'ycm-core/YouCompleteMe'  

" ALE
Plugin 'dense-analysis/ale'

" css-color
Plugin 'ap/vim-css-color'

"closetags
Plugin 'alvan/vim-closetag'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" NERDtree
map <C-n> :NERDTreeToggle<CR>
" exclude files
let NERDTreeIgnore=['\(.js\|.html\|.css\)\@<!$[[file]]']	
let NERDTreeIgnore+=['^src/vendor$']	
" autostart nerdtree

function! DefaultFile()
	if argc() == 0
		e ./src/scripts/app.js
		call InitNERD()
	endif
endfunction

function! InitNERD()
	" enable line numbers
	let NERDTreeShowLineNumbers=1
	" make sure relative line numbers are used
	autocmd FileType nerdtree setlocal relativenumber
	NERDTree
endfunction

function! StartVim()
	if &filetype ==# 'javascript' || &filetype ==# 'html'
		call InitNERD()
	elseif argc() == 0
		call DefaultFile()
	endif	
endfunction

autocmd vimenter * call StartVim() | wincmd p

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1

" ALE
let g:ale_linters={'javascript': ['eslint'], 'html': ['htmlhint']}
let g:ale_htmlhint_options='--config=./.htmlhintrc'

" closetags
let g:closttags_filename='*.html, *.js'
