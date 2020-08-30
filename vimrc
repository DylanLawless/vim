" let mapleader =","
let mapleader =" "

" set indentguide (pathogen bundle) by default
let g:indent_guides_enable_on_vim_startup = 1

" Navigating with guides

"Unmap arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

set foldmethod=indent
set list listchars=tab:›\ ,trail:-,nbsp:·,extends:>,precedes:<,eol:¬

" Colour scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" curl http://www.vim.org/scripts/download_script.php?src_id=13400 -o wombat256mod.vim
 set t_Co=256
" color wombat256mod
color slate
set background=dark

execute pathogen#infect()
" filetype off "  I turn this on, but check for the setting further down for vim-latex
filetype plugin indent on
syntax on
set showcmd
"set cursorline
set ruler
set incsearch
set colorcolumn=80
"highlight ColorColumn ctermbg=lightcyan guibg=blue
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" set vim-ariline theme 
" let g:airline_theme='simple'
let g:airline_theme='minimalist'

" Set status line with filename showing
"First, set last status to 2 using the following:
"set laststatus=2
"Then set status line to %f for short file name.
"set statusline=%F
"For the full path to the file, use %F. For short name use %f

"Open NERDTree with Cntrl+n
map <C-n> :NERDTreeToggle<CR>
" Open NERDTree on current file 
nnoremap <silent> <Leader>n :NERDTreeFind<CR>
" change movement to NT from ctrl+Wctrl+h to space+h
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" git commands 
map <leader>gh :diffget //3<CR>
map <leader>gu :diffget //2<CR>
map <leader>gs :G<CR>


" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
    set splitbelow
    set splitright
"set to recognise .md as markdown for colour
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Always show line numbers but only in the current window
set number
set relativenumber

":au WinEnter * :setlocal number
":au WinEnter * :setlocal nonumber

" Automatically sresize vertical splits
":au WinEnter * :set winfixheight
":au WinEnter * :wincmd =

"  to undo changes to a file after closing and reopening; uses the
"  .vimrc/undodir
set undofile
set undodir=~/.vim/undodir

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"another way to do this is as follows:
"augroup reload_vimrc " {
"	    autocmd!
"	        autocmd BufWritePost $MYVIMRC source $MYVIMRC
"	augroup END " }


" Vim-latexatex settings - check if these are duplicate/cancel my standard settings up top. 
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to 'plaintex' instead of 'tex', which results in vim-latex not being loaded. The following changes the default
let g:tex_flavor = 'latex'


" Vimtex quickfix window
" The default value of g:vimtex_quickfix_mode=2 means that the quickfix window does not become active after an error. You should make sure it is set to 2 (or 0 so that it is never opened). I like to also disable quickfix for warnings and have it auto-close after 2 keystrokes, which mean you can keep typing and the window just disappears if you don't care about the errors.
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_autoclose_after_keystrokes=2
let g:vimtex_quickfix_mode=2  " open on errors without focus


""____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
""___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
"             "|_|   |_|

"
""LATEX
"Word count:
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

"MARKDOWN


" Real programmers use spaces not TABs
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
set shiftround
" "set noexpandtab
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" To set up powerline for vim
" cd ~/.vim/bundle/
" git clone https://github.com/powerline/powerline.git
"https://powerline.readthedocs.io/en/latest/usage/other.html#vim-statusline
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/




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
