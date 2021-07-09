" Gibraltar (neovim)
" 2021 Ayush Shenoy (@masala-man)
" masala-man/rice-gibraltar
" tested on Manjaro 21.0.7 Ornara
"---------------------------------

"Env Variables
"
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
"Plugins
"
call plug#begin()
" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Autocomplete
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
" Formatting and Linting
Plug 'dense-analysis/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'elzr/vim-json'
" Themes
"
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
"" UI Features
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/neoranger'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
Plug 'lilydjwg/colorizer'
" Others
Plug 'chrisbra/Colorizer'
"Plug 'anned20/vimsence'
Plug 'dylanaraps/wal.vim'
Plug 'chrisbra/unicode.vim'
call plug#end()

"Config
"
" UI
colorscheme wal
syntax on
syntax enable
set number
set nu
set splitbelow splitright
set incsearch
hi TabLineFill ctermfg=Blue ctermbg=Red
hi TabLineSel ctermfg=Black ctermbg=Blue
hi Pmenu ctermbg=Blue
highlight VertSplit ctermbg=none
" Misc
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
" Backup
set nobackup
set noswapfile
set nowritebackup
" Search
set ignorecase
set smartcase
" Tab and Indent
set expandtab
set tabstop=4
set shiftwidth=4
" Split Separator
set encoding=utf8
set fillchars+=vert:\|
" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
autocmd VimEnter * AirlineTheme snazzy
" Gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
" ALE
let g:ale_sign_highlight_linenrs = 1
let g:ale_sign_error = '‼!'
let g:ale_sign_warning = '∙∙'
highlight ALEErrorSign ctermfg=red ctermbg=black
highlight ALEWarningSign ctermfg=yellow ctermbg=black
let g:airline#extensions#ale#error_symbol = '!!'
let g:airline#extensions#ale#warning_symbol = '..'
highlight ALEErrorSignLineNr ctermfg=red ctermbg=black
let g:airline#extensions#ale#enabled = 1
let b:ale_linters = ['pyflakes', 'flake8', 'pylint']
autocmd VimEnter * ALEDisable
" NCM2
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" NERDtree
let NERDTreeShowBookmarks=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
" Startify
autocmd * StartifyReady IndentLinesDisable
let g:startify_custom_header = [
\ '                  __                 ',
\ '   ___    __  __ /\_\     _______    ',
\ '  /`_ `\ /\ \/\ \\/\ \   /` _  __`\  ',
\ ' /\ \/\ \\ \ \_/ |\ \ \ /\ \/\ \/\ \ ',
\ ' \ \_\ \_\\ \___/  \ \_\\ \_\ \_\ \_\',
\ '  \/_/\/_/ \/__/    \/_/ \/_/\/_/\/_/',
\ ' ++++++++++++++++++++++++++++++++++++']
" Hotkeys
"  Plugin Menu Navigation
nmap <C-T> :TagbarToggle<CR><C-L>
nmap <C-O> :NERDTreeToggle<CR><C-L>
imap <C-T> <esc>:TagbarToggle<CR><C-L>i
imap <C-O> <esc>:NERDTreeToggle<CR><C-L>i
nnoremap <C-U> :UndotreeToggle<CR>
"  Linting
nmap <C-N> :ALEToggle<CR>
"  Escape Buffer
nmap <C-Q> :Startify<CR><C-L>

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
    autocmd BufWritePost .zshrc !source %

" ALA-LC Indic Transliteration
imap <leader>a ā
imap <leader>u ȧ
imap <leader>i ī
imap <leader>u ū
imap <leader>e ē
imap <leader>o ō
imap <leader>r r̥
imap <leader>R ṟ
imap <leader>T تṯ
imap <leader>m ṃ
imap <leader>l ḷ
imap <leader>L ḻ
imap <leader>h ḥ
imap <leader>s ś
imap <leader>S ṣ
imap <leader>t ṭ
imap <leader>d ḍ
imap <leader>n ṇ
imap <leader>j ñ
imap <leader>N ṅ
