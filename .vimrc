set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" my plugins
Plugin 'valloric/youcompleteme'
"Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gabrielelana/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'xuhdev/vim-latex-live-preview'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

let mapleader = "\<Space>"

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" For YCM
set completeopt-=preview
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"  let g:ycm_show_diagnostics_ui = 1
"  let g:ycm_enable_diagnostic_signs = 0
"  let g:ycm_enable_diagnostic_highlighting = 0
"  let g:ycm_echo_current_diagnostic = 0
"  let g:ycm_always_populate_location_list = 0
"  let g:ycm_open_loclist_on_ycm_diags = 0
let g:ycm_global_ycm_extra_conf = '/home/sweta/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" For syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_cpp_compiler_options = '-std=c++11'
" let g:syntastic_c_compiler_options = '-std=c99'
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" map <leader>s :SyntasticCheck<CR>

" For vim-airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
let g:airline_section_x = ''
let g:airline_section_y = ''
"let g:airline_section_c = '%F'
"let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#show_buffers = 0

" For NERD-commenter
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_c = 1
let g:NERDCustomDelimiters = { 'asm': { 'left': '//' } }

" For NERDTree
map <silent> <leader>n :NERDTreeToggle<CR>

" For haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_classic_highlighting = 0

" For Ctrl-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" For vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Coloration
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme mycolorscheme

" Insert mode abbreviations
ab iio   #include <iostream>
ab fitn  for (int i=0; i<n; i++)
ab co    std::cout <<
ab ci    std::cin  >>
ab el    << std::endl


" Documentation of file
iab fidoc /**
\<CR> @file
\<CR>@author  Sweta Ghimire <sghimi3@lsu.edu>
\<CR>@section Description 
\<CR> 
\<CR>/<Up>

" Documentation of function
iab fudoc /**
\<CR> 
\<CR>@param   
\<CR>@return  
\<CR>/<Up><Up><Up>


" Tab/space/numbering/formatting options
set number
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set ignorecase
set smartcase
set hlsearch
set wrap
set magic
set formatoptions=nt
set textwidth=80
set wrapmargin=0
set backspace=indent,eol,start
set ff=unix
set conceallevel=2
set clipboard=unnamedplus
set mouse=nv

" Shortcut to save
:nnoremap <leader>w :w<CR>
" Press the backslash to turn off highlighting and clear any message already displayed.
:nnoremap <silent>\ :nohlsearch<Bar>:echo<CR>
" Shortcut to call run script that compiles and runs programs
:nnoremap <leader>r :! run % 
" Compile and run tex files if Makefile is necessary
:nnoremap <leader>c :! make && file=$(echo % \| sed "s/\.tex/\.pdf/") && evince $file && make clean<CR>
" Find size of current assembly file
:nnoremap <leader>f :! fsize % 

" Call Tabularize to align columns 
noremap <leader>t :Tabularize /
" Map O to create newline without going into Insert mode
nnoremap O o<Space><Backspace><Esc>

" Automatically close braces after pressing enter
inoremap {<CR> {<CR>}<Esc>ko

nnoremap j gj
nnoremap k gk

"map <C-j> /[<CR>ci[
"imap <C-j> <Esc>/[<CR>ci[
"map <C-k> /[<CR>xxi
"imap <C-k> <Esc>/[<CR>xxi
"map <C-k> /{<CR>ciB
"imap <C-k> <Esc>/{<CR>ciB

" au BufNewFile,BufRead *.txt  set filetype=rst
au BufNewFile,BufRead *.para set filetype=rst
au BufEnter *.tex set tw=0
au BufEnter *.S set sw=4 ts=4
au BufEnter *.c set sw=2 ts=2
"au BufEnter *.md set sw=4 ts=4

" Remove delay when escaping in Vim
set timeoutlen=1000 ttimeoutlen=10

" automatically enter paste mode when pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
