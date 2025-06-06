" Table of Contents
" 1) Vundle
"   1.1) Filetypes
"   1.2) Utilities
"   1.3) UI Plugins
"   1.4) Code Navigation
" 2) UI Tweaks
" 3) Keyboard shortcut Setup
" 4) vim environment handling tweaks (needs work / renaming)
" 5) File navigation
" 6) Auto Commands
"   6.1) Filetypes
"   6.1) Normalization
" 7) Project-Specific items
" 8) nvim support
" 9) New things I learn

""" Setup Vundle =======================
set nocompatible " required for Vundle
filetype off     " required for Vundle

" Initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle.  Required
Plugin 'gmarik/Vundle.vim'

" Set leader
let mapleader=","
let maplocalleader="\\"

""""" Filetypes ========================

""""""" Ruby
Plugin 'vim-ruby/vim-ruby'

""""""" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'mhinz/vim-mix-format'

""""""" Elm
Plugin 'lambdatoast/elm.vim'

""""""" JavaScript
Plugin 'claco/jasmine.vim'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'Shutnik/jshint2.vim'
Plugin 'burnettk/vim-angular'
Plugin 'mtscout6/vim-cjsx'
Plugin 'ElmCast/elm-vim'

Plugin 'hail2u/vim-css3-syntax'

""""""" Markdown
" Use fenced code blocks in markdown
Plugin 'jtratner/vim-flavored-markdown'
  let g:markdown_fenced_languages=['ruby', 'javascript', 'elixir', 'clojure', 'sh', 'html', 'sass', 'scss', 'haml', 'erlang']
" Markdown is now included in vim, but by default .md is read as Modula-2
" files.  This fixes that, because I don't ever edit Modula-2 files :)
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set tw=80

""""""" Dockerfile
Plugin 'ekalinin/Dockerfile.vim'

""""" End Filetypes ====================

""""" Utilities ========================
Plugin 'editorconfig/editorconfig-vim' " EditorConfig support

Plugin 'scrooloose/syntastic' " Syntax highlighting
  let g:syntastic_mode_map = { "mode": "passive",
                             \ "passive_filetypes": ["java", "html", "css", "scss"] }
Plugin 'tomtom/tcomment_vim'  " Line commenting
  " By default, `gc` will toggle comments

Plugin 'janko-m/vim-test'                " Run tests with varying granularity
  let g:test#filename_modifier = ':.'
  nmap <silent> <leader>t :TestNearest<CR>
  nmap <silent> <leader>T :TestFile<CR>
  nmap <silent> <leader>a :TestSuite<CR>
  nmap <silent> <leader>l :TestLast<CR>
  nmap <silent> <leader>g :TestVisit<CR>

Plugin 'christoomey/vim-tmux-navigator'  " Navigate between tmux panes and vim splits seamlessly
Plugin 'tpope/vim-fugitive'              " git support from dat tpope
Plugin 'vim-scripts/SyntaxRange'         " Allow ranges within a file to define different syntax mappings
Plugin 'mattn/webapi-vim' 		           " vim interface to web apis.  Required for gist-vim
Plugin 'mattn/gist-vim'                  " create gists trivially from buffer, selection, etc.
  let g:gist_open_browser_after_post = 1
  let g:gist_detect_filetype = 2
  let g:gist_post_private = 1
  if has('macunix')
    let g:gist_clip_command = 'pbcopy'
  endif

Plugin 'sjl/gundo.vim'
  nnoremap <F5> :GundoToggle<CR>
""""" End Utilities ====================

""""" UI Plugins =======================
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes' " UI statusbar niceties
  set laststatus=2                      " enable airline even if no splits
  let g:airline_theme='luna'
  let g:airline_powerline_fonts=1
  let g:airline_enable_branch=1
  let g:airline_enable_syntastic=1
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_linecolumn_prefix = '␊ '
  let g:airline_linecolumn_prefix = '␤ '
  let g:airline_linecolumn_prefix = '¶ '
  let g:airline_branch_prefix = '⎇ '
  let g:airline_paste_symbol = 'ρ'
  let g:airline_paste_symbol = 'Þ'
  let g:airline_paste_symbol = '∥'
  let g:airline#extensions#tabline#enabled = 0
  let g:airline_mode_map = {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'REPLACE',
        \ 'v' : 'VISUAL',
        \ 'V' : 'V-LINE',
        \ 'c' : 'CMD   ',
        \ '': 'V-BLCK',
        \ }
Plugin 'chriskempson/base16-vim' " base16 theme
Plugin 'dandorman/vim-colors'
"Plugin 'roman/golden-ratio'
""""" End UI Plugins ===================

""""" Code Navigation ===============
Plugin 'ctrlpvim/ctrlp.vim.git'
  let g:ctrlp_match_window_bottom = 1    " Show at bottom of window
  let g:ctrlp_working_path_mode = 'ra'   " Our working path is our VCS project or the current directory
  let g:ctrlp_mru_files = 1              " Enable Most Recently Used files feature
  let g:ctrlp_jump_to_buffer = 2         " Jump to tab AND buffer if already open
  let g:ctrlp_open_new_file = 'r'        " open selections in a vertical split
  let g:ctrlp_open_multiple_files = 'r' " opens multiple selections in vertical splits to the right
  let g:ctrlp_arg_map = 0
  let g:ctrlp_dotfiles = 0               " do not show (.) dotfiles in match list
  let g:ctrlp_showhidden = 0             " do not show hidden files in match list
  let g:ctrlp_split_window = 0
  let g:ctrlp_max_height = 40            " restrict match list to a maxheight of 40
  let g:ctrlp_use_caching = 0            " don't cache, we want new list immediately each time
  let g:ctrlp_max_files = 0              " no restriction on results/file list
  let g:ctrlp_working_path_mode = ''
  let g:ctrlp_dont_split = 'NERD_tree_2' " don't split these buffers
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|gitkeep)$',
        \ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png|psd|DS_Store|ctags|gitattributes)$'
        \ }
  " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  " let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co'] " if you want to use git for this rather than ag
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<c-e>', '<c-space>'],
        \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ 'AcceptSelection("r")': ['<cr>'],
        \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
        \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
        \ 'PrtHistory(-1)':       ['<c-n>'],
        \ 'PrtHistory(1)':        ['<c-p>'],
        \ 'ToggleFocus()':        ['<c-tab>'],
        \}

Plugin 'tpope/vim-vinegar' " navigate up a directory with '-' in netrw, among other things
Plugin 'ervandew/supertab'
""""" End Code Navigation ===========

call vundle#end() " required for Vundle

" Turn on plugins, indentation, etc.
filetype plugin indent on
""" End setup Vundle ===================

""" UI Tweaks ==========================
set number " line numbering
set t_Co=256 " Force 256 colors

" Turn off menu in gui
set guioptions="agimrLt"
" Turn off mouse click in gui
set mouse=""

" in case t_Co alone doesn't work, add this as well:
" i.e. Force 256 colors harder
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set t_ut= " improve screen clearing by using the background color
set background=dark
syntax enable
colorscheme molokai
set enc=utf-8
set term=screen-256color
let $TERM='screen-256color'

" Highlighting line or number follows....
set cul " highlight current line
" If you want to just highlight the line number:
" hi clear CursorLine
" augroup CLClear
"   autocmd! ColorScheme * hi clear CursorLine
" augroup END
" hi CursorLineNR cterm=bold
" augroup CLNRSet
"   autocmd! ColorScheme * hi CursorLineNR cterm=bold
" augroup END

" Highlight current column
set cuc

" change vim cursor depending on the mode
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " OS X iTerm 2 settings
    if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
  else
    " linux settings (gnome-terminal)
    " TODO: Presently in GNOME3 terminal seems to ignore this gconf setting.
    " Need to open a bug with them...
    if has("autocmd")
      au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
      au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
      au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    endif
  endif
endif

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Open files where we left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
""" End UI Tweaks ======================

""" Keyboard shortcut setup =====================
" Remove highlights
" Clear the search buffer when hitting return
nnoremap <cr> :nohlsearch<cr>

" NO ARROW KEYS COME ON
" map <Left>  :echo "no!"<cr>
" map <Right> :echo "no!"<cr>
" map <Up>    :echo "no!"<cr>
" map <Down>  :echo "no!"<cr>

" Custom split opening / closing behaviour
map <C-N> :vsp .<CR>
map <C-C> :q<CR>

" reselect pasted content:
noremap gV `[v`]

" Redraw my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Open the alternate file
map ,, <C-^>

" Comment/uncomment blocks by selecting them visually and using # or -#
vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>

""" End Keyboard shortcut setup =================

""" Vim environment handling tweaks ====
""""" BACKUP / TMP FILES
" taken from
" http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" display incomplete commands
set showcmd

" Set encoding
set encoding=utf-8

" Start scrolling 3 lines before the border
set scrolloff=3

" Whitespace stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Spell check
" set spell

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Makes foo-bar considered one word
set iskeyword+=-
""" End Vim environment handling tweaks

""" File navigation ====================
" case insensitive highlight matches in normal/visual mode
nnoremap / /\v
vnoremap / /\v
""" End File navigation ================

""" Auto Commands ======================
""""" Filetypes ========================
augroup erlang
  au!
  au BufNewFile,BufRead *.erl setlocal tabstop=4
  au BufNewFile,BufRead *.erl setlocal shiftwidth=4
  au BufNewFile,BufRead *.erl setlocal softtabstop=4
  au BufNewFile,BufRead relx.config setlocal filetype=erlang
augroup END

augroup dotenv
  au!
  au BufNewFile,BufRead *.envrc setlocal filetype=sh
augroup END
""""" End Filetypes ====================

""""" Normalization ====================
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite * silent call DeleteTrailingWS()
""""" End Normalization ================
""" End Auto Commands ==================

""" Project-Specific Items =============
" Enable per-project vimrcs
set exrc   " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files
""" End Project-Specific Items =========

""" nvim support =======================
if has('nvim')
  set unnamedclip
endif
""" nvim support =======================

""" New things I learn =================
command TIL tabe~/Documents/TIL.md
""" End New things I learn =============

""" auto read file when entering buffer
au FocusGained,BufEnter * :checktime

set bs=eol,indent,start
"""""""""""""""""""""
" vim-test extensions
"""""""""""""""""""""
function! ElixirUmbrellaTransform(cmd) abort
  if match(a:cmd, 'apps/') != -1
    return substitute(a:cmd, 'mix test apps/\([^/]*/\)', 'cd apps/\1 \&\& mix test ', '')
  else
    return a:cmd
  end
endfunction

let g:test#preserve_screen = 0
let g:test#custom_transformations = {'elixir_umbrella': function('ElixirUmbrellaTransform')}
let g:test#transformation = 'elixir_umbrella'
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir
