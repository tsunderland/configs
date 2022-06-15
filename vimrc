" Trevor Sunderlands VIMRC

" -- General --
" Set history length
set history=100
" turn off compatibility
set nocompatible
" turn on syntax highlighting
syntax on
" turn on file type indents file type recognition
filetype on
filetype indent on
" load file type plugins
filetype plugin on
" fun comments
autocmd FileType python nnoremap <buffer> <leader>c/ I#<esc>
autocmd FileType javascript nnoremap <buffer> <leader>c/ I//<esc>
autocmd FileType cpp nnoremap <buffer> <leader>c/ I//<esc>

set shiftwidth=4
set tabstop=4

" Map leader
let mapleader = ","
let g:mapleader=","

" turn off the backups
set nobackup
set nowb
set noswapfile
" type jk to exit 
inoremap jk <esc>
" set default encoding
set encoding=utf8

" -- UI --
"  wrap lines
set wrap
" auto indent
set ai
set si
" highlight the current line and column for the curson
"set cursorline
"set cursorcolumn
" always show current position in file
set ruler
" set scroll lines to keep
set scrolloff=5
" Show numbers
set number
" turn on autocompletion menu after pressing tab
set wildmenu
"make wildmenu behave like bash
set wildmode=list:longest
" ignore certain files
set wildignore=*.docx,*.o,*~,*.pyc,*.jpg,*.png,*.gif,*.pdf,*.exe,*.flv,*.img,*.xlsx
" Show status line
set laststatus=2
" make it look pretty
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
colorscheme elflord
set background=dark
" No annoying sound on errors
set noerrorbells
set novisualbell
" text folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" -- Editing --
" go to first non-blank character
map 0 ^
" Add enclosing brackets to visual selection
xnoremap <leader>( <ESC>`>a)<ESC>`<i(<ESC>
xnoremap <leader>< <ESC>`>a><ESC>`<i<<ESC>
xnoremap <leader>[ <ESC>`>a]<ESC>`<i[<ESC>
xnoremap <leader>{ <ESC>`>a}<ESC>`<i{<ESC>
xnoremap <leader>" <ESC>`>a"<ESC>`<i"<ESC>
xnoremap <leader>' <ESC>`>a'<ESC>`<i'<ESC>

" -- Searching --
" Highlight matching characters as you type
set incsearch
" ignore case sensitivity in search
set ignorecase
" Override ignorecase option above if searching with capitals. 
set smartcase
"show partial commands as you type
set showcmd
" Height of the command bar
set cmdheight=2
"show the mode you're in
set showmode
" show matching words during search
set showmatch
" highlight while doing a search
set hlsearch
" search into subfolders
set path+=**
" file search
let g:netrw_banner=0 " disable annoying banner
let g:netrw_liststyle=3 "tree view
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1 " Open splits to the right
let g:netrw_winsize=25 " Open window to 25% of the page width
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^|\s\s\)\zs\.\S\+'
" check |netrw_browse-maps| for more info
" disable highlighting when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Do :help cope if you are unsure what cope is. It's super useful!
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
" To go to the next search result do:
"   <leader>n
" To go to the previous search results do:
"   <leader>p
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" -- Getting around --
" treat long lines as break lines
map j gj
map k gk
" move between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove



" -- Packages --
packadd! matchit 
command! Ctags !/usr/bin/ctags .
" ctrl+] jump to tag under cursor
" ctrl+[ jump to previous cursor
" ctrl+t jump to start

" -- Spell Check --
map <leader>ss :setlocal spell!<cr>
set spelllang=en_us

" shortcuts 
" next spelling item
map <leader> sn ]s
" previous spelling item
map <leader> sp [s
" look up
map <leader> s/ z=

" -- Misc --
"  If vim > 7.3, we can undo even after saving it
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" Return to last edit position when opening files (You want this!)
if has("autocmd")
    au  BufReadPost *  if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" |  endif
endif
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
