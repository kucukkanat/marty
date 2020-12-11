" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>
" Make backspace work normal !
set backspace=2
" Always search case insensitive
set ignorecase
" Search is case sensitive if contains an uppercase letter
set smartcase
" Autoload file if changed outside vim
set autoread
" No irritating swap file
set noswapfile
" Map esc key to ;; for conveinenve
imap ;; <Esc>
" Set tab size
set autoindent
set tabstop=2
set shiftwidth=2
" Vim puts spaces instead of tab when you use tab key
set expandtab
" Set line numbers
set number
" Enable syntax highlighting
syntax on  
" Highlight search
set hlsearch
" Add suffixes to be able to go to files without extension
set suffixesadd+=.js
set suffixesadd+=.ts
set suffixesadd+=.jsx
set suffixesadd+=.tsx
" Copy to clipboard
vmap '' :w !pbcopy<CR><CR>

" Open / Close tabs easily
" CR is Carriage Return ~ ENTER
nmap TC :tabclose<CR>
nmap TN :tabnew 
" Enable AutoComplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" Set Mouse for 'a' = 'All'
set mouse=a
" Go to file for npm scoped packages
set isfname+=@-@
" Set path for nodejs projects for gf
set path=$PWD/**

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" ===== END CORE CONFIG ======= "

" PLUGINS
" Toggle NERDTree easily!
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
" Show hidden files on NERDtree by default
let NERDTreeShowHidden=1

" VSCode colorscheme
set t_Co=256
colorscheme codedark

" Coc.vim Config
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_global_extensions= ['coc-omnisharp','coc-tsserver']


" Better active tab highlight
hi TabLineSel ctermfg=Red ctermbg=Yellow
