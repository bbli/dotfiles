syntax enable
set nocompatible
set hidden
set number relativenumber
set showcmd "To show keys pressed in normal mode; useful for completing Vim sentences
filetype on
filetype plugin on
"set cindent
set hlsearch
set incsearch
set lazyredraw
set laststatus=2
set t_Co=256
set foldenable
set foldlevel=0
set foldmethod=manual
"set list lcs =tab:\|\
"set listchars=tab:\|\
"set list
set ruler
set splitright
set number ""relativenumber
set title
set cursorline
set autoread "doesn't work in terminal atm
set gdefault "/g is used in command mode substitution by default
"autocomplete with spellcheck
set complete+=kspell
"set clipboard=unamedplus
set wrap
set mouse=a
set tabstop=4
set expandtab "Tabs are now spaces, whatever that means
set wildmenu "This is default in Neovim
set showmatch "Will highlight matching parantheses, brackets, etc"
set shiftwidth=4
set autoindent
set undofile
set undodir=~/.undodir/

""""""""Plugins""""""""
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'mhinz/vim-startify'

Plug 'osyo-manga/vim-over'
"Plug 'unblevable/quick-scope'
"Plug 'justinmk/vim-sneak' "didn't really find myself using this
"Don't really need all search highlighted as I am typing
"Files
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'milkypostman/vim-togglelist'
"Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
"Plug 'wellle/tmux-complete.vim'
Plug 'ncm2/ncm2-path'
Plug 'fgrsnau/ncm2-otherbuf', { 'branch': 'ncm2' }
"Plug 'ncm2/ncm2-jedi'

"Terminal Interactions
" For asynchronous make builds
"Plug 'tpope/vim-dispatch'
"Plug 'benmills/vimux'
"Plug 'jpalardy/vim-slime' "useful for creating specific state in script for profiling
Plug 'christoomey/vim-tmux-runner'

"Git
"For Gvsplit and co
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
"Plug 'gregsexton/gitv', {'on': ['Gitv']}
"Plug 'lambdalisue/gina.vim'
"Plug 'cohama/agit.vim'

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Latex
"Plug 'lervag/vimtex'
"Plug 'brennier/quicktex'
"
"Markdown stuff
Plug 'mmai/vim-markdown-wiki'
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.vim'
"Plug 'jtratner/vim-flavored-markdown'
"Plug 'rhysd/vim-gfm-syntax'
"Undo

"Text Objects 
"Plug 'coderifous/textobj-word-column.vim'
"Plug 'glts/vim-textobj-indblock'
"Plug 'kana/vim-textobj-user' 
Plug 'wellle/targets.vim'

"Syntax
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'tommcdo/vim-lion'
Plug 'Yggdroot/indentLine'
"Language pack for a lot of things
"Plug 'sheerun/vim-polyglot'
"
"May not be needed with vs+<C-]> combo
"Still may be good for looking at a codebase for the first time
"Maybe
Plug 'majutsushi/tagbar'

"Front End Development
"Plug 'pangloss/vim-javascript'
"Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'carlitux/deoplete-ternjs'
Plug 'tpope/vim-surround' "Why do I need this plugin again?
Plug 'Valloric/MatchTagAlways'
"Plug 'mattn/emmet-vim'
" Beautify is kinda weird when acting on html,
" and benefit for javascript seems to be minimal
"Plug 'maksimr/vim-jsbeautify'
"
"Colors
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'arcticicestudio/nord-vim'

""Misc
if has('nvim')
	"Plug 'simnalamburt/vim-mundo'
	Plug 'vimlab/split-term.vim'
    "Plug 'Shougo/denite.nvim'
endif
if $SSH_CONNECTION
    "Plug 'prabirshrestha/async.vim'
    "Plug 'prabirshrestha/asyncomplete.vim'
    "Plug 'prabirshrestha/asyncomplete-buffer.vim'
    "Plug 'prabirshrestha/asyncomplete-file.vim'
"elseif has('nvim')
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "Plug 'zchee/deoplete-jedi
endif
call plug#end()

if !has('nvim')
	set ttymouse=xterm2
    "Plug 'Shougo/neocomplete.vim'
endif
"if $SSH_CONNECTION
"elseif has('nvim')
    "call deoplete#custom#set('ultisnips', 'rank', 9999)
"endif

"Making ALt usable on Linux
for i in range(97,122)
	  let c = nr2char(i)
	    exec "map \e".c." <M-".c.">"
		  exec "map! \e".c." <M-".c.">"
	  endfor
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
"""Leader maps must be defined after this command.
let mapleader=" "
let maplocalleader="-"

""""""""Leader Keys""""""""

nnoremap <leader>zz :nohlsearch<CR>
" Eventually disable nerdcommenter defaults so I can use `cm` instead
nnoremap <leader>m A\<C-c>
"nnoremap <leader>f :set foldmethod=indent<CR> <bar> :set foldlevel=0<CR>
"nnoremap <leader>o :set foldlevel=5<CR>
"nnoremap <leader><leader>f :set foldmethod=indent<CR> <bar> :set foldlevel=1<CR>

nnoremap <leader>gm :Magit<CR>
nmap <leader>gp <Plug>GitGutterPreviewHunk
nmap <leader>gs <Plug>GitGutterStageHunk
nmap <leader>gu <Plug>GitGutterUndoHunk
nmap <leader>gn <Plug>GitGutterNextHunk
nmap <leader>gN <Plug>GitGutterPrevHunk
nmap <leader>gl :VTerm<CR>git tree<CR>
nnoremap <leader>gd :Gvdiff 

nnoremap <leader><leader>c :OverCommandLine<CR>

"nmap <leader>j :call JsBeautify()<CR>

nnoremap <leader>os :VTerm<CR>
"nnoremap <localleader>s :Term<CR>

nnoremap <leader>oo :FZF<CR>
nnoremap <leader>ob :FZF ../<CR>
nnoremap <leader><leader>oh :FZF ~<CR>

nnoremap <leader>ff :OverCommandLine<CR>Ack 
nnoremap <leader>fw :OverCommandLine<CR>AckWindow 
cnoremap FF FZF

nnoremap <leader>tu :UndotreeToggle<CR>
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>tw :AirlineToggleWhitespace<CR>
nnoremap <leader>ts :set spell!<CR>
nnoremap <leader>tn :NERDTreeToggle<CR>
nnoremap <leader>tp :set nopaste<CR>
nnoremap <leader>ti :IndentGuidesToggle<CR>
nmap <leader>tq :call ToggleQuickfixList()<CR>
nmap <leader>tl :call ToggleLocationList()<CR>

nnoremap <F9> :!ctags -R --sort=yes .<CR>

nnoremap <leader>p "pp
nnoremap <leader>d "pd
vnoremap <leader>d "pd
nnoremap <leader>y "py
vnoremap <leader>y "py

nnoremap <C-]> :vs<CR><C-]>
nnoremap <leader>jt <C-]>

"autocmd BufEnter *.py  nnoremap <buffer> <leader>c I#<esc>
"autocmd BufEnter *.m  nnoremap <buffer> <leader>c I%<esc>
""""""""Local Leader Keys""""""""
nnoremap <localleader>v :e ~/.vimrc<CR>
nnoremap <localleader>b :e ~/.bash_aliases<CR>
nnoremap <localleader>g :e ~/.gitconfig<CR>
nnoremap <localleader>n :e ~/.config/nvim/init.vim<CR>

"nnoremap <localleader>vp :VimuxPromptCommand<CR>
"nnoremap <localleader>r :VimuxRunLastCommand<CR>
"nnoremap <localleader>vs :VimuxInterruptRunner<CR>

nnoremap <localleader>ww :MarkdownPreview<CR>
nnoremap <localleader>wc :MarkdownPreviewStop<CR>

"nnoremap <localleader>e :!python % <CR>
nmap <localleader>e <Plug>(processing-run)

"nnoremap <localleader>t <C-W>T
vnoremap <localleader>y "+y
nnoremap <localleader>y "+y
vnoremap <localleader>d "+d
nnoremap <localleader>d "+d
""""""""Meta Keys""""""""
"To move lines intuitively
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
vnoremap <M-y> "0
"vnoremap <M-u> "+
nnoremap <M-y> "0
"nnoremap <M-u> "+

nnoremap <M-m> qh
nnoremap <M-h> @h 
"nnoremap <C-n> @m 
"nnoremap <M-n> dd

map <M-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

""""""""Fn Keys""""""""
nnoremap <F2> :TagbarToggle<CR>
nnoremap <F3> :AirlineToggleWhitespace<CR>

"nnoremap <F4> :setlocal spell  spelllang=en_us<CR>
"nnoremap <F5> :set nospell<CR>

"nnoremap <silent> <F8> :NERDTreeToggle<CR>
"nnoremap <F10> :set nopaste

""""""""Semi Colon Keys""""""""
inoremap ;c <C-c>
vnoremap ;c <C-c>
nnoremap ;q :q<CR>
nnoremap ;z :q!<CR>
nnoremap ;w <C-c>:w<CR>
inoremap ;w <C-c>:w<CR>
vnoremap ;w <C-c>:w<CR>
nnoremap ;n :bn<CR>
"nnoremap ;;n :2bn<CR>
"nnoremap ;;N :2bp<CR>
nnoremap ;N :bp<CR>
nnoremap ;d :bwipeout<CR>
nnoremap ;D :bwipeout!<CR>
nnoremap ;; ;
nnoremap <leader>; ,
nnoremap ;t :MtaJumpToOtherTag<CR>
nnoremap ;o <C-^>

nnoremap ;r @:

""""""""Normal Mode maps""""""""
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
"nnoremap EE @
nnoremap C c$
nnoremap D d$
nnoremap Y y$
nnoremap gb gi
nnoremap E $
"nnoremap w W
"nnoremap W w
"nnoremap b B
"nnoremap B b

""""""""Command Mode maps""""""""
cnoremap sE %s
nnoremap <leader>ss :OverCommandLine<CR>%s/
"For grep
cnoremap cn cnext
cnoremap cN cprev
cnoremap SB set scrollbind
cnoremap NSB set noscrollbind
"cnoremap tc tabc
cnoremap vsb vertical sb
cnoremap tj tjump
cnoremap think :e ~/Dropbox/Notes/MyThoughts/Ways-of-Thinking/Comp_Sci_Thinking/Design-Principles.md


""""""""Operator Mode maps""""""""
"onoremap w W
"onoremap W w
"onoremap b B
"onoremap B b
"onoremap ) i)
"onoremap ] i]
""""""""Insert Mode maps""""""""
" To be honest, I don't think this is nesscary. Those keys are not awkward,
" and I only mapped it because I was fixated on insert normal mode
inoremap ]] <C-c>A

"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
""""""""Control Maps""""""""
"This may be dangerous as vim has a lot of built in control key maps
"Only do to overide
"nnoremap <C-]> :vs<CR><C-]>
nnoremap <C-[> <C-t>
nnoremap <C-j> :vs<CR><C-]>
nnoremap <C-n> <C-^>
vmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <C-c><C-l> V<Plug>SlimeRegionSend
nmap <C-c><C-c> <Plug>SlimeParagraphSend
nmap <C-c>v     <Plug>SlimeConfig

""""""""Colors""""""""
"makes vim colorscheme the same as the terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"Makes a solarized approximation for vim
"let g:solarized_termcolors=256
colorscheme gruvbox
set background=dark
augroup filetype_color
	autocmd!
	autocmd FileType text color nova
	autocmd FileType vim color seoul256
	autocmd FileType matlab color seoul256
	autocmd FileType python color gruvbox
	autocmd FileType markdown color nova
	autocmd FileType latex color nova
    autocmd FileType html color nova
    autocmd FileType javascript color gruvbox
    autocmd FileType css color nova
    autocmd FileType scheme color gruvbox
    autocmd FileType c color gruvbox
    autocmd FileType cpp color gruvbox
    autocmd FileType clojure color gruvbox
augroup END

augroup buffer_color
	autocmd!
	autocmd BufEnter vim colorscheme seoul256
	"autocmd BufEnter *.txt colorscheme seoul256
	autocmd BufEnter *.txt colorscheme nova
	autocmd BufEnter *.py colorscheme gruvbox
	autocmd BufEnter *.m colorscheme seoul256
    autocmd BufEnter *.md colorscheme nova
	autocmd BufEnter *.tex colorscheme nova
    autocmd BufEnter *.html color nova
    autocmd BufEnter *.js color gruvbox
    autocmd BufEnter *.css color nova
    autocmd BufEnter *.scm color gruvbox
    autocmd BufEnter *.c color gruvbox
    autocmd BufEnter *.cpp color gruvbox
    autocmd BufEnter *.h color gruvbox
    autocmd BufEnter *.clj color gruvbox
augroup END

""""""""Other Autocommands""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown "Make vim recognize .md as markdown file
autocmd BufNewFile,BufReadPost *.txt set filetype=markdown "Make vim recognize .md as markdown file
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

""""""""Misc""""""""
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
nnoremap <Space> <Nop>
" nnoremap <Up> <Nop>
" nnoremap <Down> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>
"nnoremap <silent> <C[> :CtrlP<CR>


""""""""Plugin related variables""""""""
autocmd BufEnter * call ncm2#enable_for_buffer()
"Actually independent of ncm2 plugin. Just code for QOL when using autocomplete
set completeopt=noinsert,menuone,noselect

let g:indentLine_setColors = 0

"let g:indent_guides_enable_on_vim_startup = 1
"let g:gitgutter_sign_added = 'a'
"let g:gitgutter_sign_modified = 'm'
"let g:gitgutter_sign_removed = 'r'
"let g:gitgutter_sign_modified_removed = 'mr'
let g:gitgutter_map_keys = 0

"let g:neodark#use_256color = 1
let g:sneak#s_next = 1
let g:enable_bold_font = 1


let g:processing_no_default_mappings = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'vue' : 1,
    \}

" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['prettier-eslint','eslint'],
\}
" Enable completion where available.
let g:ale_completion_enabled = 1
" Put this in vimrc or a plugin file of your own.
 " Set this setting in vimrc if you want to fix files automatically on save.
 " This is off by default.
 let g:ale_fix_on_save = 1
 



let g:used_javascript_libs = 'd3,vue'
"let g:cm_matcher={'module': 'cm_matchers.abbrev_matcher', 'case':'smartcase'}
"let g:asyncomplete_auto_popup = 1
"let g:spacegray_low_contrast = 1

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'soft'
"Makes sure tex files are read as latex type
let g:tex_flavor = 'latex'
let g:vimtex_mappings_enabled=1
"let g:ycm_python_binary_path = '/usr/bin/python3'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }

let g:vimtex_view_method = 'zathura'
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":0.1"}
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_no_mappings = 1
let g:slime_python_ipython = 1
"let g:slime_dont_ask_default = 1
"let g:instant_markdown_slow=1
"Converting markdown to pdf
"autocmd BufWritePost *.md !markdown-pdf % -o %.pdf
"let g:vimwiki_hl_headers = 1

let g:UltiSnipsExpandTrigger = ";;" 
let g:UltiSnipsJumpForwardTrigger = "<leader><leader>"
let g:UltiSnipsJumpBackwardTrigger = "<c-j>"

let g:mkdp_path_to_chrome = "firefox"
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1

"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:airline_theme='distinguished'
let g:promptline_theme = 'airline'
"Makes it so actual buffer number shows up in the tabline. Not nesscary since idx mode works now
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#enabled = 1
"Just show the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#vimtex#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
" This should allow me to select buffers by their numbers. But is currently not working
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 1
"Do not draw separators for empty sections (only for the active window) >
"This is for a tag outline, to be used with majutsushi/tagbar
let g:airline#extensions#tagbar#enabled=0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#vimagit#enabled = 1
"let g:airline_symbols.maxlinenr
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7

let g:ackprg = 'ag --vimgrep --ignore=tags'

let g:mkdp_path_to_chrome = "firefox"
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1

let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffCommand = "diff"


"nnoremap <C-j> <C-W><C-j>
"nnoremap <C-k> <C-W><C-k>
"nnoremap <C-l> <C-W><C-l>
"nnoremap <C-h> <C-W><C-h>

let g:promptline_preset = {
        \'a' : [ promptline#slices#conda_env() ],
        \'b' : [ promptline#slices#cwd({'dir_limit':2}) ],
        \'c' : [ promptline#slices#vcs_branch() ],
        \'y' : [ promptline#slices#git_status() ]}
"\'a' : [ promptline#slices#conda_env() ],
"\'b' : [ promptline#slices#user() ],
 "\'warn' : [ promptline#slices#last_exit_code() ]}
"Use this one for custom thing on left
"     \'b'    : '#(df -h| head -n 4 | tail -n 1)',
let g:tmuxline_preset = {
     \'a'    : '#S',
     \'win'  : ['#I', '#W'],
     \'cwin' : ['#I', '#W', '#F'],
     \'y'    : ['%R', '%a', '%m', '%d', '%Y'],
     \'z'    : '#H'}

"let g:tmuxline_preset = {
"     \'a'    : '#S',
"     \'c'    : ['#(whoami)', '#(uptime  | cut -d " " -f 1,2,3)'],
"     \'win'  : ['#I', '#W'],
"     \'cwin' : ['#I', '#W', '#F'],
"     \'x'    : '#(date)',
"     \'y'    : ['%R', '%a', '%Y'],
"     \'z'    : '#H'}

"autocmd BufWritePost *.tex Dispatch! latexmk -pdf %
"function! SourceIfExists(file)
  "if filereadable(expand(a:file))
    "exe 'source' a:file
  "endif
"endfunction
" }
"SourceIfExists(~/.vim_config)
source ~/.vim_config
"this only works when calling vimdiff from command line
"so its useless for comparing different versions with git
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
