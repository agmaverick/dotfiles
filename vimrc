
"== Vim basic config ==
set nocompatible   " disables vi compatibility
set noerrorbells   " no error bell sound
set modelines=0    " disable Vim modelines
set encoding=utf-8 " encoding
set ttyfast        " rendering
set noswapfile     " disable creation of swap files
set ruler          " show file stats


"== Sintax highlighting ==
syntax on        " enables highlighting
set showmatch    " brackets highlight


"== Identation ==
filetype plugin indent on
set tabstop=4      " number of visual spaces per TAB
set softtabstop=4  " number of spaces in tab when editing
set expandtab      " tabs are spaces
set smartindent    " reacts to sintax/style fo the code 


"== Line numbers ==
set number         " show absolute line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


"== Cursor settings == 
" set cursorline      " show cursor line
set colorcolumn=120   " set rule on column 120
highlight ColorColumn ctermbg=0 guibg=lightgrey 


"== NERDTree ==
nnoremap <C-\> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1             " shows hidden files

