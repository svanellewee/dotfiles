let deoplete#sources#jedi#python_path = '/home/stephan/applications/venv3/bin/python'
let g:python3_host_prog = '/home/stephan/applications/venv3/bin/python'
let g:python_host_prog = '/home/stephan/applications/venv2/bin/python'
" let g:loaded_python_provider = 0
" let g:loaded_python3_provider = 0

call plug#begin('~/.local/share/nvim/plugged')
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'davidhalter/jedi-vim'
" Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries' }
call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'python': ['/home/stephan/applications/venv3/bin/pyls'],
    \ }

let g:deoplete#enable_at_startup = 1
" let g:airline_theme='violet'
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_python_yapf = {
        \ 'exe': '/home/stephan/applications/venv3/bin/yapf',
        \ 'args': ['--style google']
        \ }
let g:neoformat_enabled_python = ['yapf']


nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
