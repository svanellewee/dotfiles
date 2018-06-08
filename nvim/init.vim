set guicursor=
colorscheme delek
set backspace=indent,eol,start
set history=50        " keep 50 lines of command line history
set ruler                " show the cursor position all the time
set showcmd                " display incomplete commands
set incsearch                " do incremental searching
syntax on


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-rhubarb.git'
Plug 'fatih/vim-go'
Plug 'https://github.com/mxw/vim-jsx.git'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'elmcast/elm-vim'
" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" :q
"

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': './install.sh' }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" (Completion plugin option 1)
" Plug 'roxma/nvim-completion-manager'
" (Completion plugin option 2)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Inatialize plugin system


call plug#end()

let g:LanguageClient_serverCommands = {'python': ['/home/stephan/source/python-language-server/venv/bin/pyls']}
set hidden
let g:racer_cmd = "/home/stephan/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
