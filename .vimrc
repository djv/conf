set nocompatible " use vim defaults (this should be first in .vimrc)
filetype plugin on " load ftplugin.vim
filetype indent on " load indent.vim

set history=1000 " number of commands and search patterns to save
set binary " show control characters (ignore 'fileformat')
set smartindent " do not auto indent
set shiftround " round alignment to nearest indent when shifting with < and >
set formatoptions+=r " auto-format comments while typing
set t_Co=256
colors leo
if $BACKGROUND == "dark" " set terminal background color (see map for <F3>)
    set background=dark 
else
    set background=light
endif
"set guifont=Lucida_Console:h8 " set gvim font on Windows
syntax on " use syntax color highlighting
"colo ps_color " color scheme in ~/.vim/colors
"set visualbell " flash instead of beep -- this can be annoying
"set visualbell t_vb= " no beep or flash
set mouse=a " enable VIM mouse (see map for F12)
set ttyfast " smoother display on fast network connections
set whichwrap=b,s,<,>,[,],~ " allow most motion keys to wrap
set backspace=indent,eol,start " allow bs over EOL, indent, and start of insert
set nostartofline " if possible, keep cursor in same column for many commands
set incsearch " incremental search
set ignorecase " ignore case when searching (see smartcase)
set smartcase " do not ignore case if pattern has mixed case (see ignorecase)
set nojoinspaces " use only one space when using join
set matchpairs+=<:> " add < > to chars that form pairs (see % command)
set showmatch " show matching brackets by flickering cursor
set matchtime=1 " show matching brackets quicker than default
set modeline " docs say this is default, but not on any Vim I tried!
set autoread " automatically read file changed outside of Vim
set autowrite " automatically save before commands like :next and :make
set splitbelow " open new split windows below the current one
set winminheight=0 " This makes more sense than the default of 1
set noequalalways " do not resize windows on split/close
"set shortmess="" " long messages -- does not seem to work
set showcmd " show partial command in status line
set tags=~/tags,./tags;,tags; " semicolon searchs up, see :h file-searching
set suffixes+=.class,.pyc,.o,.so " skip bytecode files for filename completion
set suffixes-=.h " do not skip C header files for filename completion
set wrap " wrap long lines
set sidescroll=1 " smooth scroll if set nowrap. for slow terminals set to 0.
"set showbreak=>>>> " string to print before wrapped lines
" set backup " backup files before editing
" set backupdir=~/tmp,.,/tmp,/var/tmp " backup locations
set dir=~/tmp,.,/tmp,/var/tmp " swap file locations
set virtualedit=block " allow selection anywhere when in Visual block mode
set laststatus=2 " always show statusline 
set statusline=%n\ %1*%h%f%*\ %=%<[%3lL,%2cC]\ %2p%%\ 0x%02B%r%m
set ruler " show ruler, but only shown if laststatus is off
set rulerformat=%h%r%m%=%f " sane value in case laststatus is off
set nonumber " don't show line numbers
"set printoptions=number:y " put line numbers on hardcopy
" this turns on hlsearch, but clears the highlighting when Enter is hit
set wildmenu " show a menu of matches when doing completion
set hlsearch " highlight the current search pattern
set title " shows the current filename and path in the term title.
nnoremap <silent><CR> :nohlsearch<CR><CR> " in normal mode enter clears search highlight

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <right> :bnext<cr>
map <left> :bprevious<cr>

if version >= 630
    set viminfo=!,%,'20,/100,:100,s100,n~/.viminfo " options for .viminfo
else
    set viminfo=!,%,'20,/100,:100,n~/.viminfo " options for .viminfo
endif
if version >= 700
    "set cusorline " highlight the line with the cursor
    set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:% " :help 'list
    set numberwidth=4 " width of line numbers
    set nofsync " improves performance -- let OS decide when to flush disk
else
    set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:< " : help 'list
endif

" For python.vim syntax by Dmitry Vasiliev. See ~/.vim/syntax/python.vim.
let g:python_highlight_all=1

"
" Tab settings for filetypes that should be set even if ftplugin is off.
" Note: sr=shiftround, et=expandtab, ts=tabstop, sw=shiftwidth
set sr et ts=4 sw=4 " default
autocmd FileType python set sr et ts=4 sw=4 " Python
autocmd FileType make set sr noexpandtab ts=8 sw=8 " Makefile
autocmd FileType man set sr noexpandtab ts=8 sw=8 " Man page (also used by psql to edit or view)
autocmd FileType calendar set sr noexpandtab ts=8 sw=8 " calendar(1) reminder service


" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu
set wildmode=longest:full,full

set completeopt=menu,preview,longest

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

"
" maps
"

" \cwd changes current working directory
map <leader>cwd :cd %:p:h<CR>

" map Q as @q (replay the recording named q). I always use q as my throw-away
" recording name, so I start recording with "qq" then reply the recording with
" "Q". I never found a use for interactive ex-mode so I don't miss the
" original definition of Q.
nnoremap Q @q

" get rid of most annoying typo: typing q: when I meant :q.
" You can still get to cmdline-window easily by typing <Ctrl-F> in
" command mode, so loosing q: is no loss.
map q: :q

" easy indentation in visual mode
" This keeps the visual selection active after indenting.
" Usually the visual selection is lost after you indent it.
vmap > >gv
vmap < <gv

" Use display movement with arrow keys for extra precision. Arrow keys will
" move up and down the next line in the display even if the line is wrapped.
" This is useful for navigating very long lines that you often find with
" automatically generated text such as HTML.
" This is not useful if you turn off wrap.
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

" Split window selector and stacker.
" CTRL-J goes down one window and maximizes it; other windows are minimized.
" CTRL-K goes up one window and maximizes it; other windows are minimized.
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" This maps \y so that it will yank the visual selection, but also quote the
" regex metacharacters, so you can then paste into a search pattern. For
" example, use v to select some text. Press \y. Then start a search with /.
" Type CTRL-R" to insert the yanked selection. The last two mappings allow you
" to visual select an area and then search for other matches by typing * or #.
vmap <silent> <leader>y y:let @"=substitute(escape(@",'.$*[^\/~'),'\n','\\n','g')<CR>
vmap <silent> * y:let @/=substitute(escape(@",'.$*[^\/~'),'\n','\\n','g')<CR>n
vmap <silent> # y:let @/=substitute(escape(@",'.$*[^\/~'),'\n','\\n','g')<CR>N
vnoremap <silent> * :<C-U>
              \let old_reg=getreg('"')<bar>
              \let old_regmode=getregtype('"')<cr>
              \gvy/<C-R><C-R>=substitute(substitute(
              \escape(@", '\\/.*$^~[]' ), "\n$", "", ""),
              \"\n", '\\_[[:return:]]', "g")<cr><cr>
              \:call setreg('"', old_reg, old_regmode)<cr>
vnoremap <silent> # :<C-U>
              \let old_reg=getreg('"')<bar>
              \let old_regmode=getregtype('"')<cr>
              \gvy?<C-R><C-R>=substitute(substitute(
              \escape(@", '\\/.*$^~[]' ), "\n$", "", ""),
              \"\n", '\\_[[:return:]]', "g")<cr><cr>
              \:call setreg('"', old_reg, old_regmode)<cr>

" echo the date and time
"map <leader>d :echo strftime("%Y-%m-%d %H:%M:%S")<CR>

" spell check
" <F2> or \s
if version >= 700
    nnoremap <silent><F2> <ESC>:set spell!<CR>
    nnoremap <silent><leader>s <ESC>:set spell!<CR>
    "setlocal spell spelllang=en_us
else " older versions use external aspell
    nnoremap <silent><F2> <ESC>:!aspell -c "%"<CR>:edit! "%"<CR>
    nnoremap <silent><leader>s <ESC>:!aspell -c "%"<CR>:edit! "%"<CR>
endif

" tab support
if version >= 700
    map <S-left> :tabp<CR>
    map <S-right> :tabn<CR>
endif

" refresh - redraw window
" <F5>
"nnoremap <silent><F5> :redraw!<CR>

" This runs the current buffer in an X terminal that disappears after 5 minutes.
" This needs the env var $TERM set to xterm or some compatible X11 terminal.
" This does not save first!
" <F7> or \r
function RunBufferInTerm ()
    if &filetype == 'python'
        silent !$TERM -bg black -fg green -e bash -c "python %; sleep 300" &
    elseif &filetype == 'sh'
        silent !$TERM -bg black -fg green -e bash -c "./%; sleep 300" &
    elseif &filetype == 'php'
        silent !$TERM -bg black -fg green -e bash -c "php %; sleep 300" &
    elseif &filetype == 'perl'
        silent !$TERM -bg black -fg green -e bash -c "perl %; sleep 300" &
    elseif &filetype == 'cpp'
        silent !$TERM -bg black -fg green -e bash -c "g++ %; ./a.out; sleep 300" &
    elseif &filetype == 'haskell'
        silent !$TERM -bg black -fg green -e bash -c "ghci %; sleep 300" &
    endif
    sleep 1
    redraw!
endfunction
" nnoremap <silent><F12> :w<CR> :call RunBufferInTerm()<CR>
" nnoremap <silent><leader>r :call RunBufferInTerm()<CR>

autocmd FileType python map <F12> :w!<cr>:!ipython %<cr>
autocmd FileType python map <F5> :w!<CR>:!screen -x ipython -X stuff $'\%run %\n'<CR><CR>
autocmd FileType ocaml map <F12> :w!<cr>:!ocaml -w A -init %<cr>
autocmd FileType haskell map <F12> :w!<cr>:!ghci -Wall %<cr>
autocmd FileType haskell map <F11> :w!<cr>:!runghc %<cr>
autocmd FileType haskell map <F5> :w!<CR>:!screen -x ghci -X stuff $':load %\n'<CR><CR>
autocmd FileType erlang map <F12> :w!<cr>:!erlc %<cr>:!erl %<.beam<cr>
autocmd FileType tex map <F12> :w!<cr>:!latex % && xdvi -watchfile 5 %<.dvi&<cr>
autocmd FileType tex map <F11> :w!<cr>:!latex %<cr>
autocmd FileType cpp map <F11> :w!<cr>:!g++ %; ./a.out<cr>
autocmd FileType icon map <F12> :w!<cr>:!icont % && ./%<<cr>
map <F10> :make<cr>

" <F8> or \a
" yank all lines
nnoremap <silent><F8> gg"+yG
nnoremap <silent><leader>a gg"+yG
" <F3>
" toggle between dark and light backgrounds
nnoremap <silent><F3> :let &background=(&background == "dark"?"light":"dark")<CR>
" <F4>
" toggle mouse mode between VIM and xterm
function ShowMouseMode()
    if (&mouse == 'a')
        echo "MOUSE VIM"
    else
        echo "MOUSE X11"
    endif
endfunction
nnoremap <silent><F4> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>

" This is now covered by the DirDiff plugin.
" extra diff support
"
"map <silent><leader>dp :diffput<CR>
"map <silent><leader>dg :diffget<CR>

" run Vim diff on HEAD copy in SVN.
nnoremap <silent><leader>ds :call SVNDiff()<CR>
function! SVNDiff()
   let fn = bufname("%")
   let newfn = fn . ".HEAD"
   let catstat = system("svn cat " . fn . " > " . newfn)
   if catstat == 0
      execute 'vert diffsplit ' . newfn
   else
      echo "*** ERROR: svn cat failed for " . fn . " (as " . newfn . ")"
   endif
endfunction

"
" folding using the current /search/ pattern -- very handy!
"
" \z
" This folds every line that does not contain the search pattern.
" So the end result is that you only see lines with the pattern
" see vimtip #282 and vimtip #108
"map <silent><leader>z :set foldexpr=getline(v:lnum)!~@/ foldlevel=0 foldcolumn=0 foldmethod=expr<CR>
nnoremap <silent><leader>z :set foldexpr=(getline(v:lnum)=~@/)?\">1\":\"=\" foldlevel=0 foldcolumn=0 foldmethod=expr foldtext=getline(v:foldstart)<CR>
" space toggles the fold state under the cursor.
nnoremap <silent><space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<CR>
" this folds all classes and functions -- mnemonic: think 'function fold'
nnoremap <silent>zff :set foldexpr=UniversalFoldExpression(v:lnum) foldmethod=expr foldlevel=0 foldcolumn=0 foldtext=getline(v:foldstart)<CR><CR>
function UniversalFoldExpression(lnum)
    if a:lnum == 1
        return ">1"
    endif
    return (getline(a:lnum)=~"^\\s*public function\\s\\|^\\s*private function\\s\\|^\\s*function\\s\\|^\\s*class\\s\\|^\\s*def\\s") ? ">1" : "="
endfunction
" This doesn't work quite right:
    "if &filetype == 'php'
    "    if getline(a:lnum) =~ '/\*\*'
    "        call cursor(a:lnum,1)
    "        let sp = searchpair ('/\*\*','','\*/')
    "        call cursor(sp,1)
    "        let ax = search ('\n*\s*function','cW')
    "        if ax != 0
    "            return ">1"
    "        endif
    "    endif
    "    return "="
    "endif
    " @/ is the register that holds the last search pattern.

" plugins
runtime ftplugin/man.vim " allow vim to read man pages

"
" type \doc to insert PHPdocs
" see vimtip #1355
"
augroup php_doc
au!
"autocmd BufReadPost *.php,*.inc source ~/.vim/php-doc.vim
autocmd BufReadPost *.php,*.inc nnoremap <leader>doc :call PhpDocSingle()<CR>
autocmd BufReadPost *.php,*.inc vnoremap <leader>doc :call PhpDocRange()<CR>
augroup END


"
" This sets mouse support for editing XPM images in gvim.
" see h: xpm
"
function! GetPixel()
    let c = getline(".")[col(".") - 1]
    echo c
    exe "noremap <LeftMouse> <LeftMouse>r".c
    exe "noremap <LeftDrag>  <LeftMouse>r".c
endfunction
autocmd BufReadPre *.xpm noremap <RightMouse> <LeftMouse>:call GetPixel()<CR>
autocmd BufReadPre *.xpm set guicursor=n:hor20 " to see the color under cursor

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
"set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------

set textwidth=78    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
" formatoptions:
" c - autowrap COMMENTS using textwidth
" r - insert comment leader (?) on <enter>
" o - insert comment leader on 'o' or 'O'
" q - gq formats comments (?)
" n - recon numbered lists
" v - wrap on blanks
" t - autowrap TEXT using textwidth
set fo=croqnvt

autocmd FileType omlet nmap <F3> :exec 'echomsg (system("~/.vim/scripts/ocaml.annot.pl' bufname('%') (line2byte(line('.'))+col('.')-1) '"))'<RETURN> 
autocmd FileType omlet nmap <F4> :call AutoType()<CR>
set makeprg=omake
map <F5> :make<RETURN>
au BufNewFile,BufRead *.ml,*.mli,*.mll,*.mly set expandtab hidden autowrite efm=%+AFile\ \"%f\"\\,\ line\ %l\\,\ characters\ %c-%*\\d:,%Z%m 


function! AppendUnnamedReg()
    let old=@"
    yank
    let @" = old . @"
endfun

" allow reading of MS Word doc documents
" on Ubuntu you must install the antiword package.
autocmd BufReadPre *.doc set ro
autocmd BufReadPost *.doc silent %!antiword -f -s -i 1 -m 8859-1 - | fmt -ut --width=78

" allow reading of MS Word doc documents
" on Ubuntu install the antiword deb package.
autocmd BufReadPre *.doc set ro
autocmd BufReadPost *.doc silent %!antiword -i 1 -s -f "%" - |fmt -csw78

" jump to the last known position in a file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

if filereadable ("~/.vimrc_local")
    source ~/.vimrc_local
endif

" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc

" configure browser for haskell_doc.vim
let g:haddock_browser = "firefox"

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif
