" set-options
" Not backwards compatible to vi
set nocompatible

" No backup files
set nobackup
set nowritebackup
set noswapfile

" Check file on modification
set autoread

" Tabular character
set noexpandtab     " Do not expand to spaces
set tabstop=4       " tab is 4 spaces
set shiftwidth=4    " --

" Search
set hlsearch  " Highlight search (can be annoying)
set incsearch " Search/move cursor while typing

" Line highlighter
set cursorline

" Ruler (file position)
set ruler

" No line wrapping
set nowrap

" Case/Indent
set ignorecase
set smartcase
set smartindent

" Mark 81 column (only 80 characters should be typed)
set colorcolumn=81

" Line numbers ('hybrid' line nubmer, all relative except current)
set number relativenumber

" A normal backspace for deleting last character
set backspace=eol,start,indent

" syntax highlighting
syntax on

" colorscheme
" let g:alduin_Shout_Fire_Breath = 1
" let g:aludin_Shout_Aura_Whisper = 1
colorscheme afterglow

" Custom keybindings
" Toggle relative line numbers
map <F11> :set relativenumber!<CR>
" Sync complete file syntax hl by pressing F12
map <F12> :syntax sync fromstart<CR>

" Configuration for files
" C
autocmd BufNewFile,BufReadPre *.c set tabstop=2 | set shiftwidth=2 | set expandtab
autocmd BufNewFile,BufReadPre *.h set tabstop=2 | set shiftwidth=2 | set expandtab
" C++
autocmd BufNewFile,BufReadPre *.cpp set tabstop=2 | set shiftwidth=2 | set expandtab
autocmd BufNewFile,BufReadPre *.hpp set tabstop=2 | set shiftwidth=2 | set expandtab

" Plugins
" NerdTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
fun! OnlyNerdTree()
	if winnr("$") == 1
		let window1 = bufname(winbufnr(1))
		if (window1 == "NERD_tree_1")
			quit
		endif
	endif
endfun
au BufEnter * call OnlyNerdTree()

" Workspace support
set exrc    " Load .vimrc in current directory if available
set secure  " Hope it works'
