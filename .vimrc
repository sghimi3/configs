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
"Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'scrooloose/nerdtree'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'rust-lang/rust.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" For YCM
" let g:ycm_global_ycm_extra_conf = '~/defaults/ycm_conf'
" let g:ycm_confirm_extra_conf = 0
" set completeopt-=preview
" "nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_echo_current_diagnostic = 0
" let g:ycm_always_populate_location_list = 0
" let g:ycm_open_loclist_on_ycm_diags = 0

" For syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_c_compiler_options = '-std=c99'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
map <leader>s :SyntasticCheck<CR>

" For vim-airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
let g:airline_section_x = ''
let g:airline_section_y = ''
" let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%F'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" For NERD-commenter
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on


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

iab longcmt /*******************************************************************************
\<CR><Backspace><Backspace><Backspace>*******************************************************************************/<Up>

" Tab/space/numbering options
set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartcase
set hlsearch
set wrap
set magic
set formatoptions=nt
set textwidth=80
set wrapmargin=0
set backspace=indent,eol,start
set ff=unix

" Live autowrapping for papers/long texts
nnoremap <silent> <C-a> :call AutoWrap()<CR>
function AutoWrap()
  if &formatoptions =~ 'a'
    setlocal formatoptions-=a
    echo "unwrap"
  else
    setlocal formatoptions+=a
    echo "wrap"
  endif
endfunction

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

:nnoremap <leader>r :! run % <CR>
:nnoremap <leader>g :! run % 
" :nnoremap <leader>c :! make clean && make && file=$(echo % \| sed "s/\.tex//") && rm $file.blg $file.log $file.bbl $file.aux && evince $file.pdf 
:nnoremap <leader>c :! make && file=$(echo % \| sed "s/\.tex/\.pdf/") && evince $file && make clean<CR>

" Map j and k to gj and gk for better editing
nnoremap j gj
nnoremap k gk

" Map O to create newline without going into Insert mode
nnoremap O o<Space><Backspace><Esc>
inoremap {<CR> {<CR>}<Esc>ko

" align equal signs
" noremap <silent> <leader>t :Tabularize /=<CR>
noremap <leader>t :Tabularize /
let g:haskell_tabular = 1

map <C-j> /[<CR>ci[
imap <C-j> <Esc>/[<CR>ci[
"map <C-k> /[<CR>xxi
"imap <C-k> <Esc>/[<CR>xxi
"map <C-k> /_<CR>lcw
"imap <C-k> <Esc>/_<CR>lcw
map <C-k> /{<CR>ciB
imap <C-k> <Esc>/{<CR>ciB
"map <C-m> /(<CR>cib
"imap <C-m> <Esc>/(<CR>cib

" au BufNewFile,BufRead *.txt  set filetype=rst
au BufNewFile,BufRead *.para set filetype=rst
