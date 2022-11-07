:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:let mapleader = "\<space>"
:set clipboard^=unnamed,unnamedplus
:set langmap=öäÖÄ;{}[]
:inoremap Ö [
:inoremap Ä ]
:inoremap ö {
:inoremap ä }


" reload config 
nnoremap <leader>sv :source $MYVIMRC<CR>

"PLUGINS
call plug#begin('~/AppData/Local/nvim/plugged')
" sneak
Plug 'justinmk/vim-sneak'
Plug 'rickhowe/diffchar.vim'
" AUTOCOMPLETE
" source ~/AppData/Local/nvim/init.coc.vim
Plug 'neovim/nvim-lspconfig'  

"SURROUND
Plug 'tpope/vim-surround'

Plug 'ThePrimeagen/vim-be-good'

"AUTO BRACKETS FOR IF
:call setreg("f", 'A{}O','c')
nmap <M-f> @f

"JUMP NAVIGATION
if exists('g:vscode')
  Plug 'asvetliakov/vim-easymotion', { 'as': 'vsc-easymotion' }
  " Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
  call plug#end()
  finish
else
  Plug 'easymotion/vim-easymotion'
endif

"FUZZY FINDER
Plug 'ctrlpvim/ctrlp.vim'

"COMMENTS
Plug 'tpope/vim-commentary'

"AIRLINE
Plug 'vim-airline/vim-airline'

"NERDTREE
Plug 'preservim/nerdtree'
nnoremap <C-f> :NERDTreeToggle<CR>


"STYLING
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'rafi/awesome-vim-colorschemes'

"TAGBAR
Plug 'preservim/tagbar'
nmap <M-o> :TagbarToggle<CR>


"AUTOCLOSE 
Plug 'jiangmiao/auto-pairs'
call plug#end()

:colorscheme papercolor
