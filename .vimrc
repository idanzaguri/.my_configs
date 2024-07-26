call plug#begin()
  "Plug 'icymind/neosolarized'
  Plug 'scrooloose/nerdtree'
  "Plug 'godlygeek/csapprox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'chrisbra/csv.vim'
  "Plug 'dense-analysis/ale'
  "Plug 'flazz/vim-colorschemes'
  Plug 'vhda/verilog_systemverilog.vim'
  Plug 'morhetz/gruvbox'
  Plug 'godlygeek/tabular'
  Plug 'majutsushi/tagbar'
  Plug 'craigemery/vim-autotag'
  Plug 'tpope/vim-obsession'
  Plug 'airblade/vim-gitgutter'
call plug#end()

runtime macros/matchit.vim

set wmh=0   " This sets the minimum window height to 0, so you can stacki many more files before things get crowded
set number  " show line numbers
set relativenumber
"set autochdir     " this automatically changes the dir
set path+=**

" Allow deleting newlines and auto indentation with delete and backspace keys
set backspace=eol,indent,start

syntax on

set history=200

set wildmenu
set wildmode=list:longest,full
"set wildignorecase

"set guioptions-=T "remove gui toolbar

set ignorecase
set smartcase

set hls
set incsearch
set mouse=a

" Add a dictionary to the list of dictionary to be used for keyword
" completion commands CTRL-X and CTRL-K.
" set dict+=/usr/share/dict/words

"set autoindent
"

set splitbelow splitright

" Colors
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
set t_Co=256
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_number_column="bg1"
let g:gruvbox_guisp_fallback="bg"
colorscheme gruvbox


" Airline
let g:airline_theme='badwolf'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'unique_tail'


"FIXME " ALE
"FIXME "au FileType systemverilog let g:ale_linters = {'systemverilog' : ['verilator']}
"FIXME au FileType verilog_systemverilog let g:ale_linters = {'verilog_systemverilog' : ['vlog']}
"FIXME 
"FIXME "FIXME verilog_systemverilog
"FIXME 
"FIXME " Set Systemverilog 1800-2012 as the defualt linting language for .v and .sv
"FIXME let g:ale_verilog_verilator_options='-sv --default-language "1800-2017" +incdir+/home/idan/axi_uvm/vip/ /home/idan/axi_uvm/tb.sv'
"FIXME let g:ale_verilog_vlog_options='-sv -mfcu -quiet -lint=full +incdir+/home/idan/axi_uvm/vip/ /home/idan/axi_uvm/vip/ovip_axi_pkg.sv'
"FIXME 
"FIXME let g:airline#extensions#ale#enabled=1
"FIXME let g:ale_lint_on_text_changed=0

" CSV
au FileType csv let g:csv_highlight_column = 'y'
let g:csv_highlight_column = 'y'

" Verbs
" d - delete
" c - change
" > - indent
" v - visually select
" y - yank(copy)
"
" Nouns - Motions
" w - word
" b - back (by word)
" 2j - dows 2 lines
" 
" Nouns - Text Object
" iw - inner word
" it - inner tag
" i" - inner quotes
" ip - inner paragraph
" as - a sentence
"
" Nouns - Parametrized text objects
" f,F - find the next charcter
" t,T - find the next charcter
" /   - search
"
"
"
"
"put =map(range(255,0,-32),'printf(''%3d:%3d'',v:val,v:val-31)')
"


" Highlight all instances of word under cursor, when idle.
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
      au! auto_highlight
      augroup! auto_highlight
      setl updatetime=4000
      echo 'Highlight current word: Off'
      return 0
   else
      augroup auto_highlight
         au!
         au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
      augroup end
      setl updatetime=100
      echo 'Highlight current word: ON'
     return 1
   endif
endfunction


" toggle highlighting word under cursor on/off
nmap <silent> <leader>h :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>




" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list





" FILE BROWSING:

" Tweaks for browsing
"let g:netrw_banner=0        " disable annoying banner
"let g:netrw_browse_split=4  " open in prior window
"let g:netrw_altv=1          " open splits to the right
"let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)








" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back


" Set default tab length to 3 literal spaces (no tab special character will be used) to
" preserve proper formatting across platforms
" Save yanked, deleted, put text etc into UNIX clipboard
"set clipboard=unnamed
" Enable folding based on indent (on 8.0 and greater versions)
"if v:version >= 800
"    set foldmethod=indent
"    set foldnestmax=10
"    set nofoldenable
"    set foldlevelstart=10
"endif
"
"
"
"
""" Search current file for a pattern and open results in a location list
"" with the file name removed.
"command! -nargs=1 Search lvimgrep <q-args> % | lwindow | setlocal modifiable | %s/^[a-zA-Z0-9//\._]*|/|/ | setlocal nomodifiable | let @/=<q-args>
"" Copy current buffer's full file path to the global register *. This register
"" can than be pasted outside of VIM by clicking the middle mouse.
"nmap <silent> <leader>F :let @*=expand("%:p")<Enter>:echo "copied current buffer's file path: " . @*<Enter>
"" Same as ',F', but copies only file name.
"nmap <silent> <leader>f :let @*=expand("%:t")<Enter>:echo "copied current buffer's file name: " . @*<Enter>
"" Toggle spell check mode.
"" When using the '!' after a 'set' command's option, the option is toggled.
"nmap <silent> <leader>s :setlocal spell! spelllang=en_us<Enter>
"
"" Update ctags in current buffer and open tagbar
"nmap <silent> <leader>T :call MyUpdateTags()<CR>:TagbarOpen<CR>
"
"" Toggle open/close tagbar split
"nmap <silent> <leader>t :Tagbar<CR>
"
"" Update systemverilog tags for verification files
"nmap <silent> <leader>a :call MyUpdateTags()<CR>
"
"" Toggle open/close Nerd Tree
"nmap <silent> <leader>z :NERDTreeToggle<CR>
"
"" Set key mappings which will hold only in diff mode.
"if &diff
"	" Next change in diff mode.
"	nmap c ]c
"	" Previous change in diff mode.
"	nmap C [c
"	" Update diff highlighting.
"	nmap du :diffupdate<CR>
"endif
"
"" ------------- Insert Mode Mappings -----------
"" Set CTRL-B to ESC so that it is easier to move from Insert to Normal mode.
"inoremap <silent> <C-B> <ESC>



" Remove "," from the list of legal values for a file name
"set isfname-=:
 
" Tagbar plugin Configuration to support systemverilog
"let g:tagbar_type_systemverilog= {
"    \ 'ctagstype' : 'systemverilog',
"    \ 'kinds'     : [
"        \'c:classes',
"        \'t:tasks',
"        \'f:functions',
"        \'m:modules',
"        \'i:interfaces',
"        \'v:variables',
"        \'d:defines',
"        \'e:typedefs',
"        \'a:parameters'
"  \]
"\}

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"
