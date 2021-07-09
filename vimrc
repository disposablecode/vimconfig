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

" If a file is changed outside of vim, automatically reload it without asking
set autoread

set splitright
set splitbelow

"Make Y work like D and C
nnoremap Y y$

" Center screen on next search
nnoremap n nzz
nnoremap N Nzz

let mapleader=","

" Pathogen plugin
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on " Turn on all the magic, including Explorer and syntax highlighting

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
set cursorline " highlight current line


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
colorscheme molokai

" Custom maps
"nnoremap - ^
" map for all modes to test how this work REVERT in case of extrange behaviour
noremap - ^
nnoremap <leader>u guiw
nnoremap <leader>U gUiw
" Do not map in insert mode
" inoremap <c-u> <esc>gUiwea
nnoremap <leader><leader> <c-^>
nnoremap <esc><esc> :update<cr>
" Insert a hash rocket with <c-l>
inoremap <c-l>r <space>=><space>
inoremap <c-l>c }<esc>i{<cr><esc>O
inoremap <c-l>p )<esc>i(
inoremap <c-l>a <esc>O

" Setting from vim as a python IDE .vimrc file
set colorcolumn=80
highlight ColorColumn ctermbg=234
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
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](vendors|build|\.git|node_modules|documentation)'
  \}
"let g:ctrlp_cmd = 'CtrlPBuffer'
" Use Mixed instead of buffer
let g:ctrlp_cmd = 'CtrlPMixed'
" TODO add ignore files for other programming languges

" Settings for vim-airline
" cd ~/.vim/bundle
" git submodule add https://github.com/vim-airline/vim-airline.git
" Use powerline-fonts to display the fancy symbols correctly
set laststatus=2 " Show status line always

" source: https://medium.com/@jeantimex/how-to-configure-iterm2-and-vim-like-a-pro-on-macos-e303d25d5b5c
let g:airline_powerline_fonts = 1

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

inoremap <silent><C-j> <C-R>=OmniPopup('j')<cr>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<cr>


" Settings from vim-as-a-python-ide-master\.vimrc
" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<cr>
vnoremap <C-n> :nohl<cr>
" Do not map in insert mode
" inoremap <C-n> :nohl<cr>


" Quicksave command
"noremap <C-Z> :update<cr>
"vnoremap <C-Z> <C-C>:update<cr>
" Do not map in insert mode
" inoremap <C-Z> <C-O>:update<cr>
" map <C-Z> to close folder in TreeView of netrw as is noted in netrw docs
" nmap <buffer> <silent> <nowait> <c-z> <Plug>NetrwTreeSqueeze
" previous map is in vimfiles/ftplugin/netrw/netrw.vim


" Quick quit command
noremap <Leader>e :quit<cr>  " Quit current window
noremap <Leader>E :qa!<cr>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" map <c-l> for netrw
" source: https://vi.stackexchange.com/questions/5531/how-to-remap-i-in-netrw
"au! filetype netrw noremap <buffer> <c-l> <c-w>l

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
au BufNewFile,BufRead *.js,*.html,*.css,*.rb,*.md,*.txt
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

" source: https://stackoverflow.com/questions/23279292/how-to-make-vim-understand-that-md-files-contain-markdown-code-and-not-modula#23279293
" TODO: move to ~/.vim/ftdetect/markdown.vim
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Netrw config
let g:netrw_liststyle = 0
let g:netrw_sort_direction = "normal"
let g:netrw_sort_by = "exten"
" source: https://shapeshed.com/vim-netrw/
"let g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 20

" Insert system date
nnoremap <F3> "=strftime("%Y-%m-%d")<cr>Pa<space><esc>
" We should't need it in insert mode
" inoremap <F3> <C-r>=strftime("%Y-%m-%d")<cr>

" omnisharp-vim
let g:Omnisharp_start_server = 0
let g:Omnisharp_stop_server = 0
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_prefer_global_sln = 1 " I don't know what this line is for


" vim-jsx-pretty
" cd ~/.vim/bundle
" git submoduel add https://github.com/MaxMEllon/vim-jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1


" NerdCommenter React.js filetype
let g:NERDCustomDelimiters = { 'javascript': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }

"source https://unix.stackexchange.com/questions/141097/how-to-enable-and-use-code-folding-in-vim/336537#336537
"folding settings
au! BufNewFile,BufRead *.js
    \ set foldmethod=syntax |
    \ set foldnestmax=10 |
    \ set nofoldenable |
    \ set foldlevel=2
"\ set foldmethod=syntax | "fold based on indent
"\ set foldnestmax=10 | "deepest fold is 10 levels
"\ set nofoldenable | "dont fold by default
"\ set foldlevel=2 "this is just what i use

" Toggle Netrw left explore
"nnoremap <leader>w :Rexplore<cr>
" Stop using the project drawer style.
" source: http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/

" Open item from quickfix in vertical split
" source: https://stackoverflow.com/questions/16743112/open-item-from-quickfix-window-in-vertical-split
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

"Use custom emmet expand abbreviation
let g:user_emmet_expandabbr_key = '<C-b>,'
let g:user_emmet_expandword_key = '<C-b>;'
let g:user_emmet_update_tag = '<C-b>u'
let g:user_emmet_balancetaginward_key = '<C-b>d'
let g:user_emmet_balancetagoutward_key = '<C-b>D'
let g:user_emmet_next_key = '<C-b>n'
let g:user_emmet_prev_key = '<C-b>N'
let g:user_emmet_imagesize_key = '<C-b>i'
let g:user_emmet_togglecomment_key = '<C-b>/'
let g:user_emmet_splitjointag_key = '<C-b>j'
let g:user_emmet_removetag_key = '<C-b>k'
let g:user_emmet_anchorizeurl_key = '<C-b>a'
let g:user_emmet_anchorizesummary_key = '<C-b>A'
let g:user_emmet_mergelines_key = '<C-b>m'
let g:user_emmet_codepretty_key = '<C-b>c'

au! filetype netrw nmap <leader>o <cr>

" Map vinegar vim. source: https://github.com/tpope/vim-vinegar
nmap <leader>- <Plug>VinegarUp


" Only for mac spanish keyboard: exit insert mode and save
inoremap ´s <esc>:update<cr>
nnoremap ´s :update<cr>
vnoremap ´s <esc>

au BufNewFile,BufRead *.md,*.txt
    \ set wrap

