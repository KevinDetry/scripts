call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'flowtype/vim-flow'
Plug 'honza/vim-snippets'
Plug 'iCyMind/NeoSolarized'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kassio/neoterm'
Plug 'lifepillar/vim-cheat40'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Rip-Rip/clang_complete', { 'do': 'make install' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'fleischie/vim-styled-components'
Plug 'mhartington/nvim-typescript'
Plug 'pbogut/deoplete-elm'
Plug 'ponko2/deoplete-fish'
Plug 'racer-rust/vim-racer'
Plug 'sheerun/vim-polyglot'
Plug 'wokalski/autocomplete-flow'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'zchee/deoplete-jedi'

call plug#end()

set backupcopy=yes
set cursorline
set foldlevelstart=100
set foldmethod=syntax
set hidden
set ignorecase
set showmatch
set termguicolors
set undodir=~/.cache/nvim/undodir/
set undofile

colorscheme NeoSolarized

let g:neoformat_javascript_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--stdin', '--trailing-comma', 'all'],
      \ 'stdin': 1
      \ }

let g:neoformat_typescript_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--stdin', '--parser', 'typescript', '--trailing-comma', 'all'],
      \ 'stdin': 1
      \ }

" let g:neomake_rust_enabled_makers = []
" let g:user_emmet_leader_key = '<plug>y'
let g:LanguageClient_autoStart = 1
let g:airline_powerline_fonts = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:flow#enable = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:mapleader = "\<space>"
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_css = ['prettier', 'cssbeautify']
let g:neoformat_enabled_javascript = ['prettiereslint', 'prettier', 'jsbeautify']
let g:neoformat_enabled_json = ['prettier', 'jsbeautify']
let g:neoformat_enabled_typescript = ['prettier', 'tsfmt']
let g:neomake_go_gometalinter_args = []
let g:neomake_javascript_enabled_makers = ['flow', 'stylelint', 'eslint']
let g:racer_experimental_completer = 1

let g:LanguageClient_serverCommands = {
      \ 'go': ['$HOME/go/bin/go-langserver'],
      \ 'javascript': ['node', '$HOME/.local/src/javascript-typescript-langserver/lib/language-server-stdio.js'],
      \ 'javascript.jsx': ['node', '$HOME/.local/src/javascript-typescript-langserver/lib/language-server-stdio.js'],
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'typescript': ['node', '$HOME/.local/src/javascript-typescript-langserver/lib/language-server-stdio.js'],
      \ }

augroup nvim-init
  autocmd! BufWritePost * Neomake
  autocmd! BufWritePost *.rs Neomake! clippy
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

nmap <leader>a <Plug>(EasyAlign)<cr>
xmap <leader>a <Plug>(EasyAlign)<cr>

nnoremap <leader>/ :Ag<cr>
nnoremap <leader>= :Neoformat<cr>
nnoremap <leader>D :bdelete!<cr>
nnoremap <leader>F :NERDTreeToggle<cr>
nnoremap <leader>L :Lines<cr>
nnoremap <leader>Q :quit!<cr>
nnoremap <leader>R :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>T :TagbarToggle<cr>
nnoremap <leader>` :terminal fish<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>d :bdelete<cr>
nnoremap <leader>e :edit<space>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :call LanguageClient_textDocument_definition()<cr>
nnoremap <leader>h :call LanguageClient_textDocument_hover()<cr>
nnoremap <leader>l :BLines<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>r :call LanguageClient_textDocument_rename()<cr>
nnoremap <leader>s :write<cr>
nnoremap <leader>t :BTags<cr>
nnoremap <leader>w <c-w>
nnoremap <leader>z :Goyo<cr>
nnoremap <leader>~ :edit ~/.config/nvim/init.vim<cr>
nnoremap <silent> <c-l> :nohlsearch<bar>diffupdate<cr><cr><c-l>
