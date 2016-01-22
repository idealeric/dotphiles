" Welcome to vimrc land!
" Functions {{{
function! StripTrailingWhitespace()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
" Basic Settings {{{
set encoding=utf8
set shell=zsh
set nocompatible
set ruler
set modelines=1 " For mode at bottom of files.
set mat=2 " How long to blink (tenths of a second).
set history=500
set viminfo='1000,n~/.config/nvim/viminfo
set nobackup
set nowritebackup
set grepprg=ag\ --nogroup\ --nocolor
set lazyredraw " Redraw less (faster, hopefully).
set mouse=nv " mouse only in normal and visual modes
" Remember spot:
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
" sh/vim consistent tab completions
set wildmode=longest,list,full
set wildmenu
" ignore files, ctrlP uses too
set wildignore+=/tmp/*,*.so,*.swp,*.zip,*.pyc,*.less.d,*.min.js,*.min.css,*/.git/*,*/.hg/*,*.fugitiveblame
" }}}
" Basic Behavior Settings {{{
" set cursorline " highlight current line
set showmatch " show matching bracets
set backspace=indent,eol,start " intuitive backspace
set scrolloff=3 " More buffer to bottom/top
set showcmd " Show cmd next to ruler.
set foldenable
set foldlevelstart=8
set foldnestmax=8
set foldmethod=indent
" }}}
" Autocmd Settings {{{
augroup configgroup
  autocmd!
  autocmd BufWritePre *.py,*.js :call StripTrailingWhitespace()
  autocmd FileType python setlocal sw=4 sts=4 et commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
augroup END
" }}}
" Bundler {{{
set rtp+=~/.config/nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.config/nvim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'rking/ag.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'sjl/badwolf'
call neobundle#end()
" }}}
" Indent Settings {{{
set autoindent
set cindent " Smarter auto indent.
set expandtab " Tabs are spaces.
set tabstop=2
set shiftwidth=2
set softtabstop=2
filetype plugin indent on
" }}}
" General Custom Keybinding Settings {{{
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
nmap <leader>w :w<cr>
map <F1> <Esc>
imap <F1> <Esc>
" }}}
" Search and Movement Settings {{{
set ignorecase
set smartcase " case-insentive unless upper included
set hlsearch " highlight search
set incsearch " as you type search
vnoremap // y/<c-r>"<cr>
" Buffer commands:
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b
" Faster scroll:
nnoremap <C-e> 3<j-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>
" Faster window movement:
nnoremap <leader>j <c-w>j<cr>
nnoremap <leader>k <c-w>k<cr>
nnoremap <leader>l <c-w>l<cr>
nnoremap <leader>h <c-w>h<cr>
" Quickfix:
nnoremap <leader>cc :cclose<cr>
nnoremap <leader>co :copen<cr>
" }}}
" Color and Syntax Settings {{{
let g:hybrid_use_Xresources = 1
set background=dark
colorscheme hybrid
syntax enable
" }}}
" Ag Settings {{{
nmap <leader>s :Ag!<space>
" }}}
" Tag and CtrlP Settings {{{
set tags=tags;
nn <silent> <leader>t :let g:ctrlp_default_input = ''<cr>:CtrlPTag<cr>
nn <silent> <leader>e :let g:ctrlp_default_input = ''<cr>:CtrlPMRU<cr>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 45
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
" ag is fast enough that CtrlP doesn't need to cache.
let g:ctrlp_use_caching = 0
let g:ctrlp_prompt_mappings = {
    \ 'PrtClear()': ['<c-c>'],
    \ 'PrtExit()':  ['<esc>', '<c-g>'],
    \ }
let g:ctrlp_mruf_exclude = '/tmp/.*|.*/\.git/.*'
" }}}
" vim:foldmethod=marker:foldlevel=0
