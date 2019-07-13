# .vimrc

## Last updated: 7/13/19 14:37

![image](https://drive.google.com/uc?export=view&id=1qXVkMf7LPH2b1WnUdq2gLkXo37X7aHc2)

call plug#begin('~/.vim/plugged')  
Plug 'airblade/vim-gitgutter'  
Plug 'mileszs/ack.vim'  
"Side-view file explorer   
Plug 'scrooloose/nerdtree'  
Plug 'maxbrunsfeld/vim-yankstack'  
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
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }  
"Adds JavaScript syntax  
Plug 'jelera/vim-javascript-syntax'  
"Auto-complete for syntax  
Plug 'ervandew/supertab'  
"TsLint  
Plug 'heavenshell/vim-tslint'  
call plug#end()  
set nocompatible  
"Enable syntax highlighting  
"syntax enable  
syntax enable  
set syntax=monokai  
colorscheme monokai  
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
"set leader to spacebar  
let mapleader = "\<Space>"  
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
set statusline+=%F  
set laststatus=2  
let g:prettier#autoformat = 0  
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync  
"Sets the working directory to the current file's directory  
autocmd BufEnter * lcd %:p:h  
"Run TsLint automatically  
autocmd BufWritePost *.ts,*.tsx call tslint#run('a', win_getid())  
"Save the file  
nnoremap ss :w<ENTER>   
"Run Prettier  
nnoremap csp :Prettier<ENTER>   
"Un-highlight search  
nnoremap sh :nohls<ENTER>  
"Reload current Vim configuration  
nnoremap rr :source ~/.vimrc<ENTER>   
"Toggle NERDTree side-view file explorer  
nnoremap fe :NERDTreeToggle<ENTER>  
"Open fzf (fuzzy find) and start searching for file  
nnoremap ff :Files<ENTER>  
"Open fzf (fuzzy find) and start searching for file in current directory 
nnoremap cff :FZF<ENTER>  
"Open new tab 
nnoremap nnt :tabnew   
"Move to next tab 
nnoremap nt :tabn<ENTER>  
"Move to previous tab  
nnoremap pt :tabp<ENTER>  
"Close tab  
nnoremap ct :tabc<ENTER>  
"Quit  
nnoremap qq :q<ENTER>  
