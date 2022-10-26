" Gibraltar (neovim)
" 2021 Ayush Shenoy (@masala-man)
" masala-man/rice-gibraltar
" tested on Manjaro 21.0.7 Ornara
"---------------------------------
"
" Make sure plugin manager is insatlled
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
" Env Variables
"
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" Plugins
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
Plug 'rust-lang/rust.vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
" UI Features
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
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
hi! Conceal ctermfg=Blue

" Misc
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
"set laststatus=3

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
set fillchars+=vert:\│
highlight VertSplit ctermbg=black
highlight Vertsplit ctermfg=grey

" Airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
"autocmd VimEnter * AirlineTheme snazzy

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
let g:ale_linters = {'python': ['flake8'], 'rust': ['cargo']}
let g:ale_fixers = {'python': ['autoflake'],'rust': ['rustfmt']}
let g:ale_fix_on_save = 1
autocmd VimEnter *.py ALEDisable
autocmd VimEnter *.tex ALEDisable

" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
au BufEnter * call ncm2#enable_for_buffer()
au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'vimtex',
            \ 'priority': 1,
            \ 'subscope_enable': 1,
            \ 'complete_length': 1,
            \ 'scope': ['tex'],
            \ 'matcher': {'name': 'combine',
            \           'matchers': [
            \               {'name': 'abbrfuzzy', 'key': 'menu'},
            \               {'name': 'prefix', 'key': 'word'},
            \           ]},
            \ 'mark': 'tex',
            \ 'word_pattern': '\w+',
            \ 'complete_pattern': g:vimtex#re#ncm,
            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
            \ })
set completeopt=noinsert,menuone,noselect
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
"nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Split Movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Swati Corpus Shortcuts
inoremap <leader>pal $PALLAVI<CR>
inoremap <leader>anu $ANUPALLAVI<CR>
inoremap <leader>car $CHARANAM<CR>
"Ought to be ultisnipped

" Indic Transliteration
nnoremap <leader><leader>i :call ToggleVimalaKolkataUTF8()<cr>
inoremap <leader><leader>i <esc>:call ToggleVimalaKolkataUTF8()<cr>a
nnoremap <leader><leader>l :call ToggleVimalaKolkataLatexVanilla()<cr>
inoremap <leader><leader>l <esc>:call ToggleVimalaKolkataLatexVanilla()<cr>a

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

" LaTeX Settings
autocmd Filetype tex setl updatetime=1000
let g:livepreview_previewer = 'zathura'
nnoremap <leader>v :VimtexCompile<CR>
"function! ClearTex()
    "execute "VimtexStopAll"
    "execute "VimtexClean"
"endfunction
autocmd VimLeave *.tex !texclear.sh %
autocmd FileType tex nnoremap <buffer> <C-T> :VimtexTocToggle<CR><C-L>
autocmd FileType tex inoremap <buffer> <C-T> <esc>:VimtexTocToggle<CR><C-L>i
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}
let g:indentLine_fileTypeExclude = ['tex']

" Training Wheels
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>

" Syntax conceal
nnoremap <leader><leader>c :call ToggleConceal()<CR>
let g:indentLine_conceallevel = 0
function! ToggleConceal()
    if &conceallevel == 0
        set conceallevel=2
    else
        set conceallevel=0
    endif
endfunction

" Rust
let g:ale_linters.rust = ['cargo', 'rls']
let g:ale_rust_rls_toolchain = 'stable'
