call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'othree/yajs'
Plug 'mxw/vim-jsx'
Plug 'dag/vim-fish'
Plug 'mustache/vim-mustache-handlebars'
" Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'editorconfig/editorconfig-vim'
Plug 'shougo/unite.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'
Plug 'moll/vim-node'
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'


" Initialize plugin system
call plug#end()

"Syntax stuff
syntax on
syntax enable
let g:jsx_ext_required = 0
"set termguicolors
set background=light
colorscheme PaperColor


 "Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)

" Config!
set number
autocmd BufNewFile,BufRead *.js setlocal colorcolumn=100
autocmd BufNewFile,BufRead *.py setlocal colorcolumn=79
set hidden
let mapleader = "\<SPACE>"

set showcmd
set splitright
set splitbelow
set shell=bash

"" Turn off swap files
set noswapfile
set nobackup

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
set nowrap                            " Don't wrap lines
set inccommand=nosplit

" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1


" Nicer copy paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>y "+y
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


"key maps
map <leader>rr :source ~/.config/nvim/init.vim<CR>
let g:tmux_navigator_no_mappings = 1

map <BS> :TmuxNavigateLeft<cr>
map <leader>h :TmuxNavigateLeft<cr>
map <leader>j :TmuxNavigateDown<cr>
map <leader>k :TmuxNavigateUp<cr>
map <leader>l :TmuxNavigateRight<cr>
map <leader>\ :TmuxNavigatePrevious<cr>
map <c-p> :FZF<cr>
map <leader>n :noh<cr>
map <leader>a :Ack! 
"Remove all trailing whitespace by pressing F5
nnoremap <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
 
"Ultisnips
let g:UltiSnipsExpandTrigger="<Leader><Leader>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"NeoMake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

"FZF
let $FZF_DEFAULT_COMMAND= 'ag -g ""'

"Airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" set noshowmode
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

"YCM
let g:ycm_min_num_of_chars_for_completion = 3

