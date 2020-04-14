set nocompatible

syntax on

set nowrap
set encoding=utf8


"""" START Vundle Configuration
" Disable filetypefor vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""
" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

" Theme and Styling
set t_Co=256
set background=dark

let base16colorspace=256  " Access colors present in 256 colorspace

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'BufOnly.vim'
"Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf'
Plugin 'godlygeek/tabular'
Plugin 'jeetsukumaran/vim-buffergator' " \b
Plugin 'gilsondev/searchtasks.vim'
Plugin 'Shougo/neocomplete.vim'

" Generic Programming Support
Plugin 'Townk/vim-autoclose'
Plugin 'vim-syntastic/syntastic'

" Markdown / Writting
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'LanguageTool'

" Git Support
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
Plugin 'jaxbot/github-issues.vim'

" Theme / Interface
Plugin 'AnsiEsc.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'mkarmona/colorsbox'
Plugin 'chriskempson/base16-vim'
"Plugin 'ajh17/Spacegray.vim'

Plugin 'ryanoasis/vim-devicons'
Plugin 'junegunn/limelight.vim'


Plugin 'daylerees/colour-schemes'
Plugin 'ajh17/Spacegray.vim'


call vundle#end()            " required
filetype plugin indent on    " required

nmap <Leader>l :Limelight!! 0.4<CR>

let g:rehash256 = 1
let g:molokai_original = 1

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1


let g:neocomplete#enable_at_startup = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" colorscheme spacemacs-theme
colorscheme spacegray
let base16colorspace=256
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" List occurrences for search
let g:searchtasks_list=["TODO", "FIXME", "error"]

" Key maps
nmap <F8> :TagbarToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :vs<CR>
nmap <F4> :BuffergatorToggle<CR>
nmap <F5> :Gitv<CR>
" Nerdtree
" Initialize with :NERDTree .
" Iniciar NerdTree al abrir VIM
" autocmd vimenter * NERDTree


" Generación de tags
command! MakeTags !ctags -R --languages=php,ruby . &> /dev/null &
augroup PreSaveTasks
    autocmd!
    autocmd BufWritePre *.php :silent MakeTags
    autocmd BufWritePre *.rb :silent MakeTags
    " Elimina espacios al guardar
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType javascript let b:syntastic_javascript_jscs_args =
    \ get(g:, 'syntastic_javascript_jscs_args', '') .
    \ FindConfig('-c', '.jscsrc', expand('<afile>:p:h', 1))
