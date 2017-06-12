" Load Plugin
function! LoadPlugin()
    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'molokai'                                            " colorscheme
    Plugin 'a.vim'                                              " plugin: alternate Files quickly
    "Plugin 'c.vim'                                             " plugin: help c programming
    "Plugin 'showmarks'                                         " plugin: for showing marks
    Plugin 'scrooloose/nerdtree'                                " plugin for display file tree
    Plugin 'scrooloose/nerdcommenter'                           " Plugin for quickly comment
    Plugin 'bufexplorer.zip'                                    " Plugin for buffer explorer
    Plugin 'mhinz/vim-grepper'                                  " Plugin for search in multiples files
    "Plugin 'LaTeX-Suite-aka-Vim-LaTeX'                         " Plugin for latex
    "Plugin 'xmledit'                                           " Plugin for xml completion
    "Plugin 'mattn/emmet-vim'                                   " Plugin for html coding
    "Plugin 'Yggdroot/indentLine'                               " Plugin for show indent
    Plugin 'Tabular'                                            " Pluin for aligning text
    Plugin 'Tagbar'                                             " Bar showing function,  variables or macro
    "Plugin 'pangloss/vim-javascript'                           " Hightlight javacript
    "Plugin 'mxw/vim-jsx'                                       " Hightlihgt jsx

    Plugin 'Valloric/YouCompleteMe'                             " Auto complete tool
    "Plugin 'Shougo/neocomplete.vim'                            " Auto complete tool
    "Plugin 'SuperTab'                                          " Auto complete tool
    "Plugin 'maralla/completor.vim'                             " Auto complete tool
    

    Plugin 'vim-scripts/Conque-GDB'                             " GDB showing in source code
    Plugin 'vim-syntastic/syntastic'                            " Auto complete tool
    Plugin 'easymotion/vim-easymotion'                          " Navigation tool
    Plugin 'Townk/vim-autoclose'                                "
    call vundle#end()            " required

    filetype plugin on
    filetype plugin indent on    " required
endfunction
call LoadPlugin()

" mapleader
let mapleader = ","

" auto reload
if has('win32')
    autocmd! bufwritepost _vimrc source ~/_vimrc " 
else
    autocmd! bufwritepost .vimrc source ~/.vimrc " 
endif


" tags
"map <silent> <leader>tt :!  ctags -R --c++-kinds=+px --fields=+iaS --extra=+q c:\Users\Pan\Desktop\bm14_robot\Software\Arc\trunk\<cr>
"map <silent> <leader>tt :! ctags -R *<cr>
    
map <silent><F4> :! ctags -R *<cr>
if has('win32')
    set tags=tags;
    set tags+=c:\Users\Pan\Desktop\bm14_robot\Software\Kdl\Kdl_arca\orocos_kdl\src\tags
    set tags+=c:\Users\Pan\Desktop\bm14_robot\Software\Soem\soem-arca\tags
    set tags+=c:\Users\Pan\Desktop\bm14_robot\Software\Cnc\Antlr\libantlr3c-3.4\tags
    
endif

" cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    set cspc=3
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
endif

nmap <F12>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F12>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <F12>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F12>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <F12>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <F12>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <F12>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <F12>d :cs find d <C-R>=expand("<cword>")<CR><CR>
 


"--------
" Vim UI
"--------
"" encoding dectection
set fileencodings=ucs-bom,chinese,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 

set encoding=utf-8  
"set langmenu=zh_CN.UTF-8 

" enable syntax hightlight and completion
syntax on

" color scheme
set background=dark
colorscheme molokai
set guifont=Consolas:h10:cANSI

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" search
set incsearch
set hlsearch
"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase

" editor settings
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
set ruler                                                         " current cursor position 
" set relativenumber

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
" set textwidth=79
" set smarttab
set expandtab       " expand tab to space

" Gui setting
set guioptions-=T                   "hide toolbar
"set guifont=Consolas:h10:cANSI
set langmenu=en_US.UTF-8
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
 
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction 

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

set autochdir
set autowrite
"set complete-=i
"set complete-=t
set cpt=.,w,b


" Mapping 
nmap <F1> :NERDTreeToggle<cr>
nmap <F8> :TagbarToggle<cr>
map <F2> ,be  
map <C-p> "+gp 
map <C-c> "+y 
map <tab> :AS<cr>
nmap <leader>qq :tabclose<cr>
map <C-j> :lnext<cr>
map <C-k> :lprev<cr>
command! Gdb ConqueGdb

if has('win32')
    nmap <silent> <F10> :source ~/_vimrc<cr>
    nmap <silent> <F11> :e ~/_vimrc<cr>
else
    nmap <silent> <F10> :source ~/.vimrc<cr>
    nmap <silent> <F11> :e ~/.vimrc<cr>
endif
" make




"-----------------
" Plugin settings
"-----------------

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Showmarks
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 

" NerdTree 
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '^'
let g:NERDTreeWinSize= 30 

map <silent> <leader>nt :NERDTreeToggle<cr>
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('txt', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('dll', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" BufExplorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

" SuperTab
let g:SuperTabCrMapping=1

" Tabular settings
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>


" Grepper
nnoremap <C-f> :Grepper -tool findstr -switch <cr> 


" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_remove_include_errors=1
let g:syntastic_c_config_file = './.vim_syntastic_config'

" YouCompleteMe
let g:ycm_show_diagnostics_ui = 0

