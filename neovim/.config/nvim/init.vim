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
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-cssomni'
Plug 'lervag/vimtex'
Plug 'ncm2/ncm2-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ncm2/ncm2-match-highlight'
" Formatting and Linting
Plug 'dense-analysis/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'elzr/vim-json'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
"" UI Features
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
Plug 'lilydjwg/colorizer'
" Others
Plug 'chrisbra/Colorizer'
Plug 'dylanaraps/wal.vim'
Plug 'masala-man/vimala'
Plug 'lingnand/pandoc-preview.vim'
call plug#end()

" UI
colorscheme wal
syntax on
syntax enable
set number
set rnu
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
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '..'
highlight ALEErrorSign ctermfg=red ctermbg=black
highlight ALEWarningSign ctermfg=yellow ctermbg=black
let g:airline#extensions#ale#error_symbol = '!!'
let g:airline#extensions#ale#warning_symbol = '..'
highlight ALEErrorSignLineNr ctermfg=red ctermbg=black
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['autoflake']}
let g:ale_fix_on_save = 1
autocmd VimEnter * ALEDisable

" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c

inoremap <c-c> <ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> ((pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : (!empty(v:completed_item) ? ncm2_ultisnips#expand_or("", 'n') : "\<CR>" ))

" c-j c-k for moving in snippet
imap <expr> <c-u> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
smap <c-u> <Plug>(ultisnips_expand)
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" NERDtree
let NERDTreeShowBookmarks=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" Startify
"autocmd * StartifyReady IndentLinesDisable
let g:startify_custom_header = [
\ '                  __                 ',
\ '   ___    __  __ /\_\     _______    ',
\ '  /`_ `\ /\ \/\ \\/\ \   /` _  __`\  ',
\ ' /\ \/\ \\ \ \_/ |\ \ \ /\ \/\ \/\ \ ',
\ ' \ \_\ \_\\ \___/  \ \_\\ \_\ \_\ \_\',
\ '  \/_/\/_/ \/__/    \/_/ \/_/\/_/\/_/',
\ ' ++++++++++++++++++++++++++++++++++++']

" Plugin Menu Navigation
nnoremap <C-T> :TagbarToggle<CR><C-L>
nnoremap <C-O> :NERDTreeToggle<CR><C-L>
inoremap <C-T> <esc>:TagbarToggle<CR><C-L>i
inoremap <C-O> <esc>:NERDTreeToggle<CR><C-L>i
nnoremap <C-U> :UndotreeToggle<CR>
nnoremap <leader>g :Goyo<CR> 
" Linting
nnoremap <C-N> :ALEToggle<CR>
" Escape Buffer
nnoremap <C-Q> :Startify<CR><C-L>

" Easier splits
nnoremap <leader>= :vsplit<CR>
nnoremap <leader>- :split<CR>

" Split Movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Swati Corpus Shortcuts
inoremap <leader>pal $PALLAVI<CR>
inoremap <leader>anu $ANUPALLAVI<CR>
inoremap <leader>car $CHARANAM<CR>

" Indic Transliteration
nnoremap <leader><leader>i :call ToggleKolkata()<CR>
inoremap <leader><leader>i <esc>:call ToggleKolkata()<CR>a

" Easy linebreaks
function! BreakHere()
	s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
	call histdel("/", -1)
endfunction

nnoremap <leader><CR> :<C-u>call BreakHere()<CR>

" FZF
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nnoremap <leader>f :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>


" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
autocmd BufWritePost .zshrc !source %

" Training Wheels
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>

