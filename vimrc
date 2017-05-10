set nocp
set encoding=utf-8
set backspace=indent,eol,start " Allow backspacing over everything in insert
                               " mode
set history=700		" keep 700 lines of command line history
set pastetoggle=<F2>
set clipboard=unnamed " set system clipboart pointing to unnamed register

" GUI configuration
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

let mapleader=","
" Pathogen plugin
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on " Turn on all the magic, including Explorer and syntax highlighting
filetype plugin indent on

" vim like a pro book settings
set showmode " Show me when I'm in insert/overtype mode
set showcmd " When a command is in progress, show it in the status bar
set wildmenu " Magic for completion at the : command line.
set ruler " Turn on the "ruler" (status info) at the bottom of the screen
set autoindent " Indent in a smart way, instead of returning to the left margin
               " all the time
set expandtab " Expand tabs to spaces
set nowrap " Don't wrap text (makes windows ugly)
set hlsearch " Highlight all matches in text when you search
set showmatch " Show matches for braces, parens, etc.
set ignorecase " Do case-insensitive searching
set smartcase " When a search phrase has uppercase, don't be case insensitive.
set spelllang=en_us " When I want spell-checking, I want it to be english.
" Indenting
set tabstop=8 " Use industry standard 8-char tabs.
"" set shiftwidth=4 " Use standard 4-char indentation.
set shiftround " Indent/Deident to nearest 4-char boundary.

" Other useful settings
set incsearch " Do incremental searching
set number " Line numbers
set completeopt=menu,longest,preview " Options for colpletion


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
colorscheme koehler

" Custom maps
map - ^

" Setting from vim as a python IDE .vimrc file
set colorcolumn=80
highlight ColorColumn ctermbg=233
set undolevels=700
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Settings for ctrlp
" cd ~/.vim/bundle
" git submoduel add https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
" TODO add ignore files for other programming languges

" Settings for vim-airline
" cd ~/.vim/bundle
" git submodule add https://github.com/vim-airline/vim-airline.git
" Use powerline-fonts to display the fancy symbols correctly
set laststatus=2 " Show status line always

" Settings for jedi-vim
" cd ~/.vim/bundle
" git submoduel add git://github.com/davidhalter/jedi-vim.git
"" let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone "Add preview to show preview doc window
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Settings from vim-as-a-python-ide-master\.vimrc
" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
" Do not map in insert mode
" inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Settings for SimpylFold
" cd ~/.vim/bundle
" git submoduel add https://github.com/tmhedberg/SimpylFold.git
let g:SimpylFold_docstring_preview=1

" Disable error bells. use this if you are in GVim
set visualbell t_vb=
if has("autocmd") && has("gui")
    au GUIEnter * set t_vb=
endif

" Use hidden buffers
set hidden

" Indent according to file type
au BufNewFile,BufRead *.js,*.html,*.css
    \ set shiftwidth=2

au BufNewFile,BufRead *.py
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set fileformat=unix

" Maximize vim's window on startup
autocmd GUIEnter * simalt ~X

" Set font according to the actual gui
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif