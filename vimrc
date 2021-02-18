"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let mapleader =","
let mapleader =" "

" set indentguide (pathogen bundle) by default
let g:indent_guides_enable_on_vim_startup = 1

" Navigating with guides, Unmap arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

execute pathogen#infect()

" When file is edited its plugin is loaded
" Example; vim-latex. Makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
filetype indent on
syntax on

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"set to recognise .md as markdown for colour
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Sets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set nowrap
set showcmd
set foldmethod=indent
set list listchars=tab:›\ ,trail:-,nbsp:·,extends:>,precedes:<,eol:¬

" Splits open at the bottom and right.
set splitbelow
set splitright

" Always show line numbers but only in the current window
set number
set relativenumber

" Undo changes to a file after closing and reopening
set undodir=~/.vim/undodir
set undofile
set noswapfile
set nobackup

" Use TABs not spaces
" The width of a TAB is set to 4 but still is a \t. 
" Vim will only interpret it to be having a width of 4.
set tabstop=4
set shiftwidth=4	" Indents will have a width of 4
set softtabstop=4	" Sets the number of columns for a TAB

" Start scrolling 8 lines from top or bottom
set scrolloff=8

" set signcolumn=yes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searches
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make search case insensitive
" Incremental search gives results while search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Finding files. Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Allows
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" Consider
" - :b lets you autocomplete any open buffer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colour scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~/.vim/colors
"color wombat256mod
"color gruvbox
set background=dark
set t_Co=256

"set cursorline
set ruler
set incsearch
set colorcolumn=80

highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" set vim-ariline theme 
let g:airline_theme='simple'
" let g:airline_theme='minimalist'

" Set status line with filename showing
"First, set last status to 2 using the following:
"set laststatus=2
"Then set status line to %f for short file name.
"set statusline=%F
"For the full path to the file, use %F. For short name use %f

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
" Open with Cntrl+n
map <C-n> :NERDTreeToggle<CR>
" Open on current file 
nnoremap <silent> <Leader>n :NERDTreeFind<CR>
" Change movement to NT from ctrl+Wctrl+h to space+h
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" git commands 
map <leader>gh :diffget //3<CR>
map <leader>gu :diffget //2<CR>
map <leader>gs :G<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LaTeX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Starting with Vim 7, the filetype of empty .tex files defaults 
" to 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
let g:tex_flavor = 'latex'

" Vimtex quickfix window
" The default value of g:vimtex_quickfix_mode=2 means that the quickfix window 
" does not become active after an error. You should make sure it is set to 2 
" (or 0 so that it is never opened). I like to also disable quickfix for 
" warnings and have it auto-close after 2 keystrokes, which mean you can keep 
" typing and the window just disappears if you don't care about the errors.
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_autoclose_after_keystrokes=2
let g:vimtex_quickfix_mode=2  " open on errors without focus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" LATEX
" Word count:
autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
" Compile document using xelatex:
autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
" Code snippets
" lstlisting for writing code
autocmd FileType tex inoremap ,lst \begin{lstlisting}<Enter><++><Enter>\end{lstlisting}<Esc>kdiwi
autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>
autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,bt {\blindtext}
autocmd FileType tex inoremap ,nu $\varnothing$
autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MARKDOWN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" To set up powerline for vim
" cd ~/.vim/bundle/
" git clone https://github.com/powerline/powerline.git
" https://powerline.readthedocs.io/en/latest/usage/other.html#vim-statusline
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/




" https://www.youtube.com/watch?v=YhqsjUUHj6g

" leader remap not working at the moment
" rebind the <leader> key to be , instead of \
" let mapleader = ","

" map sort function to ,s  (good for python etc)
" vnoremap <Leader>s :sort<CR>

" Show white space
" MUST be inserted BEFOREthe colourscheme command
" show unnecessary whitespace
" autocmd ColorScheme * highligh ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/
"
"
" " Limelight settings
" " To start stop use :Limelight / Limelight!
" " " Color name (:help cterm-colors) or ANSI code
"  let g:limelight_conceal_ctermfg = 'gray'
"  let g:limelight_conceal_ctermfg = 240
" 
"  " Color name (:help gui-colors) or RGB color
"  let g:limelight_conceal_guifg = 'DarkGray'
"  let g:limelight_conceal_guifg = '#777777'
" 
"  " Default: 0.5
"  let g:limelight_default_coefficient = 0.7
" 
"  " Number of preceding/following paragraphs to include (default: 0)
"  let g:limelight_paragraph_span = 1
" 
"  " Beginning/end of paragraph
"  "   When there's no empty line between the paragraphs
"  "   and each paragraph starts with indentation
"  let g:limelight_bop = '^\s'
"  let g:limelight_eop = '\ze\n^\s'
" 
"  " Highlighting priority (default: 10)
"  "   Set it to -1 not to overrule hlsearch
"  let g:limelight_priority = -1
"
" Submodules
" To add a submodule, e.g. git within the git such as in bundles, use
" git add submodule https://github.com/...
" To clone use
" git clone --recursive-submodules https://....main_project
" or if you forgot or cant use recursive, do 
" git submodule init
" git submodule update
