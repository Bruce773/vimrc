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
"TypeScript suggestions and tslint fixes
Plug 'Quramy/tsuquyomi'
"EasyTags for tag syntax highlighting
Plug 'xolox/vim-easytags'
"Auto fix eslint/tslint errors
Plug 'ruanyl/vim-fixmyjs'

call plug#end()
set nocompatible
"Enable syntax highlighting
syntax on
colorscheme monokai

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
"Show current file at the bottom of the screen
set statusline+=%F%{FugitiveStatusline()}
set laststatus=2
let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"Sets the working directory to the current file's directory
autocmd BufEnter * lcd %:p:h
"Configure Ag.vim
let g:ag_working_path_mode="r"
"Run TsLint automatically
autocmd BufWritePost *.ts,*.tsx call tslint#run('a', win_getid())

"Auto fix eslint errors
let g:fixmyjs_engine = 'tslint'

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
"Open fzf (fuzzy find) and start searching for file in current directory
nnoremap <SPACE>cff :FZF<ENTER>
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
"Ag search
nnoremap <Space>ts :Ag 
"Enhanced git status
nnoremap <Space>gs :Gstatus<ENTER>
nnoremap <Space>gb :Gblame<ENTER>

nnoremap <Space>ts :TsuQuickFix<ENTER>
"Fix eslint errors
nnoremap <SPACE><SPACE>f :Fixmyjs<ENTER>
