call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
"Side-view file explorer
Plug 'scrooloose/nerdtree'
Plug 'maxbrunsfeld/vim-yankstack'
"Syntax highlighting for .tsx files
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"git-vim is for better Git integration with Vim
Plug 'motemen/git-vim'
Plug 'tpope/vim-surround'
"Git in vim
Plug 'tpope/vim-fugitive'
"EasyMotion is for searching for chars within a file
Plug 'easymotion/vim-easymotion'
Plug 'Quramy/tsuquyomi'
"Great plugin for searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Adds JavaScript syntax
Plug 'jelera/vim-javascript-syntax'
"Auto-complete for syntax
Plug 'ervandew/supertab'
"TsLint
Plug 'heavenshell/vim-tslint'
"Monokai colour scheme
Plug 'crusoexia/vim-monokai'
"NERDTree and Git joined
Plug 'Xuyuanp/nerdtree-git-plugin'
"Syntax checking
Plug 'w0rp/ale'
"Searcher
Plug 'rking/ag.vim'
" CocVim is a wonderful autocomplete tool
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" VimWiki is great for keeping notes inside Vim
Plug 'vimwiki/vimwiki'
" fzf and fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"TypeScript suggestions and tslint fixes
"Plug 'Quramy/tsuquyomi'

"Auto fix eslint/tslint errors
Plug 'ruanyl/vim-fixmyjs'

call plug#end()
call plug#end()
set nocompatible
call plug#end()
call plug#end()
"Enable syntax highlighting
syntax on
colorscheme monokai

" Disable Coc outdated Vim warning
let g:coc_disable_startup_warning = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"Syntax coloring for tsx files
" dark red
"hi tsxTagName guifg=#E06C75

" orange
"hi tsxCloseString guifg=#F99575
"hi tsxCloseTag guifg=#F99575
"hi tsxAttributeBraces guifg=#F99575
"hi tsxEqual guifg=#F99575

" yellow
"hi tsxAttrib guifg=#F8BD7F cterm=italic

"hi ClassName guifg=#9DBA4E

"Display numbers on left hand side
set number
set showmatch
"Allow use of Mac default CMD + c and CMD + v
set clipboard=unnamed
"Show tabs at the top of the editor window
set showtabline=2
set autoindent
set autoread
set showmode
set ttyfast
set visualbell
"tab complete filenames
set wildmode=longest,list,full
set wildmenu
"Show hidden files in NERDTree
let NERDTreeShowHidden=1
"set leader to spacebar
nnoremap <Space> <Leader>
"use jk in place of esc
ino jk <esc>
cno jk <c-c>
vno v <esc>
set noerrorbells
set showcmd
"Highlight searches
set hlsearch!
set updatetime=100
set hlsearch
set nu
set rnu
"Configuration for ctags
set tags=tags
"Show current file at the bottom of the screen
set statusline+=%F%{FugitiveStatusline()}
set laststatus=2
let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"Sets the working directory to the current file's directory
autocmd BufEnter * lcd %:p:h

"Run TsLint automatically
autocmd BufWritePost *.ts,*.tsx call tslint#run('a', win_getid())

"Auto fix eslint errors
let g:fixmyjs_engine = 'tslint'

"command pasted from terminal telling me to paste in .vimrc after installing
"fzf via Homebrew

set rtp+=/usr/local/opt/fzf

"Open NERDTree by default when Vim opens
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Save the file
nnoremap <SPACE>ss :w<ENTER> 
"Run Prettier
nnoremap <SPACE>csp :Prettier<ENTER> 
"Un-highlight search
nnoremap <SPACE>sh :nohls<ENTER> 
"Reload current Vim configuration
nnoremap <SPACE>rr :source ~/.vimrc<ENTER> 
"Toggle NERDTree side-view file explorer
nnoremap <SPACE>fe :NERDTreeToggle<ENTER>
"Open fzf (fuzzy find) and start searching for file
nnoremap <SPACE>ff :Files<ENTER>
"Open new tab
nnoremap <SPACE>nnt :tabnew 
"Move to next tab
nnoremap <SPACE>l  :tabn<ENTER>
"Move to previous tab
nnoremap <SPACE>h :tabp<ENTER>
"Close tab
nnoremap <SPACE>ct :tabc<ENTER>
"Quit
nnoremap <SPACE>qq :q<ENTER>
"Toggle focus between NERDTRee and file
map <Space>ww <C-w>w

"Enhanced git status
nnoremap <Space>gs :Gstatus<ENTER>
"Enhanced git blame
nnoremap <Space>gb :Gblame<ENTER>

nnoremap <Space>ts :TsuQuickFix<ENTER>
"Fix eslint errors
nnoremap <SPACE><SPACE>f :Fixmyjs<ENTER>

"ctrl-<movement> split navigation instead of initial ctrl-w
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
