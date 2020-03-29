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

Plug 'troydm/zoomwintab.vim'
Plug 'osyo-manga/vim-over'
"Plug 'unblevable/quick-scope'
"Plug 'justinmk/vim-sneak' "didn't really find myself using this
"Don't really need all search highlighted as I am typing
"Files
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdcommenter'
 Plug 'tpope/vim-commentary'
Plug 'milkypostman/vim-togglelist'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-ultisnips'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'fgrsnau/ncm2-otherbuf', { 'branch': 'ncm2' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'
"Plug 'jackguo380/vim-lsp-cxx-highlight'
"C++
" Plug 'https://github.com/jansenm/vim-cmake.git'

"Terminal Interactions
"---
" For asynchronous make builds
"Plug 'tpope/vim-dispatch'
"Plug 'benmills/vimux'
"Plug 'jpalardy/vim-slime' "useful for creating specific state in script for profiling
Plug 'christoomey/vim-tmux-runner'

"Git
"---
"For Gvsplit and co
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
"For diffing code that is not between branches
"Plug 'AndrewRadev/linediff.vim'
" When I work on a large codebase and need to see past logs on a certain line
"Plug 'rhysd/git-messenger.vim'

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Latex
"Plug 'lervag/vimtex'
"Plug 'brennier/quicktex'
"
"Markdown stuff
"Plug 'mmai/vim-markdown-wiki'
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
Plug 'michaeljsmith/vim-indent-object'
"Plug 'wellle/context.vim'
"Plug 'junegunn/vim-peekaboo'
" For camelCase word deletion
"Plug 'Julian/vim-textobj-variable-segment'
Plug 'bronson/vim-visual-star-search'

"Syntax
"Plug 'w0rp/ale'
"Plug 'jiangmiao/auto-pairs'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
"Language pack for a lot of things
"Plug 'sheerun/vim-polyglot'
"
"May not be needed with vs+<C-]> combo
"Still may be good for looking at a codebase for the first time
"Maybe
Plug 'majutsushi/tagbar'
" Plug 'ludovicchabant/vim-gutentags'

"Front End Development
"Plug 'pangloss/vim-javascript'
"Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'carlitux/deoplete-ternjs'
Plug 'tpope/vim-surround' "Why do I need this plugin again?
" Plug 'Valloric/MatchTagAlways'
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

" nnoremap <leader><leader>m qm
nnoremap <leader><leader>m @m
nnoremap <leader><leader>z :nohlsearch<CR>

nmap <leader><leader>c gcc
vmap <leader><leader>c gc

nnoremap <leader><leader>t :MerlinTypeOf<CR>
nnoremap <leader><leader>i :call <SID>show_documentation()<CR>

nnoremap <leader>gm :Magit<CR>
nmap <leader>gp <Plug>(GitGutterPreviewHunk)
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gN <Plug>(GitGutterPrevHunk)
nmap <leader>go <Plug>(git-messenger)
nmap <leader>gl :VTerm<CR>git tree<CR>
nnoremap <leader>gd :Gvdiff 

command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': 'ag --ignore .git -g ""'}, <bang>0)

nnoremap <leader>oa :HFiles<CR>
nnoremap <leader>os :VTerm<CR>
nnoremap <leader>oo :Files<CR>
nnoremap <leader>ob :Files ../<CR>
nnoremap <leader>oh :History<CR>
nnoremap <leader>oy :CocList yank<CR>
" nnoremap <leader>op :CocList mru<CR>
"nnoremap <leader><leader>oh :FZF ~<CR>
nnoremap <leader>ol :CocList<CR>
nnoremap <leader>oc :CocList commands<CR>

nnoremap <leader>ff :CocList grep <CR>
nnoremap <leader>fa :OverCommandLine<CR>Ack 
" nnoremap <leader>fw :OverCommandLine<CR>AckWindow 
nnoremap <leader>fr :OverCommandLine<CR>%s/\<<C-r><C-w>\>/
nnoremap <leader>fs :OverCommandLine<CR>%s/

nnoremap s <Nop>
nnoremap <leader>sl :VtrSendLinesToRunner<CR>
vnoremap <leader>sl :VtrSendLinesToRunner<CR>
nnoremap <leader>ss :VtrSendCommand<CR>
nnoremap <leader>sp :VtrAttachToPane<CR>
nnoremap <leader>sf :VtrFlushCommand<CR>
nnoremap <leader>sd :VtrSendCtrlD<CR>

nnoremap <leader>tu :UndotreeToggle<CR>
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>tw :AirlineToggleWhitespace<CR>
nnoremap <leader>ts :set spell!<CR>
nnoremap <leader>tn :NERDTreeToggle<CR>
nnoremap <leader>tp :set nopaste<CR>
nnoremap <leader>ti :IndentGuidesToggle<CR>
nnoremap <leader>tr :reg<CR>
nmap <leader>tq :call ToggleQuickfixList()<CR>
nmap <leader>tl :call ToggleLocationList()<CR>

nnoremap <F9> :!ctags -R --sort=yes .<CR>

nnoremap <leader>p "zp
nnoremap <leader>P "zP
nnoremap <leader>d "zd
vnoremap <leader>d "zd
nnoremap <leader>y "zy
vnoremap <leader>y "zy

nnoremap <leader>jt <C-]>
nmap <leader>jd <Plug>(coc-definition)
" nnoremap <leader>jb <C-t>
" nnoremap <leader>js :vs<CR><C-]>
nmap <leader>jE <Plug>(coc-diagnostic-prev)
nmap <leader>je <Plug>(coc-diagnostic-next)
nnoremap <leader>jc g;
nnoremap <leader>jC g,
"nmap <leader>jr <Plug>(coc-references) tbh * is better

nnoremap <leader>dn ]c
nnoremap <leader>dN [c
nnoremap <leader>dl :.diffput<CR>
nnoremap <leader>dp dp

"nnoremap <leader>mr qa
"nnoremap <leader>mm @a
"autocmd BufEnter *.py  nnoremap <buffer> <leader>c I#<esc>
"autocmd BufEnter *.m  nnoremap <buffer> <leader>c I%<esc>
""""""""Local Leader Keys""""""""
nnoremap <localleader>v :e ~/.vimrc<CR>
nnoremap <localleader>b :e ~/.bash_aliases<CR>
nnoremap <localleader>g :e ~/.gitconfig<CR>
nnoremap <localleader>n :e ~/.config/nvim/init.vim<CR>
nnoremap <localleader>c :CocConfig<CR>

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
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <C-w><Space> <C-w>=

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
inoremap ;; ;
vnoremap ;w <C-c>:w<CR>
inoremap ;w <C-c>:w<CR>
nnoremap ;n :bn<CR>
nnoremap ;q :q<CR>
nnoremap ;z :q!<CR>
nnoremap ;w <C-c>:w<CR>
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
nnoremap / /\<
nnoremap <leader>/ /
"For grep
cnoremap cn cnext
cnoremap cN cprev
cnoremap SB set scrollbind
cnoremap NSB set noscrollbind
"cnoremap tc tabc
cnoremap vsb vertical sb
cnoremap tj tjump
cnoremap think e ~/Dropbox/Notes/MyThoughts/Ways-of-Thinking/Comp_Sci_Thinking/Design-Principles.md


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
"nnoremap <C-[> <C-t>
"nnoremap <C-j> :vs<CR><C-]>
"nnoremap <C-n> <C-^>
"vmap <c-c><c-c> <Plug>SlimeRegionSend
"nmap <C-c><C-l> V<Plug>SlimeRegionSend
"nmap <C-c><C-c> <Plug>SlimeParagraphSend
"nmap <C-c>v     <Plug>SlimeConfig

""""""""Colors""""""""
"makes vim colorscheme the same as the terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


"Makes a solarized approximation for vim
"let g:solarized_termcolors=256
colorscheme gruvbox
set background=dark
"augroup filetype_color
	"autocmd!
	"autocmd FileType text color nova
	"autocmd FileType vim color seoul256
	"autocmd FileType matlab color seoul256
	"autocmd FileType python color gruvbox
	"autocmd FileType markdown color nova
	"autocmd FileType latex color nova
    "autocmd FileType html color nova
    "autocmd FileType javascript color gruvbox
    "autocmd FileType css color nova
    "autocmd FileType scheme color gruvbox
    "autocmd FileType c color gruvbox
    "autocmd FileType cpp color gruvbox
    "autocmd FileType clojure color gruvbox
"augroup END

"augroup buffer_color
	"autocmd!
	"autocmd BufEnter vim colorscheme seoul256
	""autocmd BufEnter *.txt colorscheme seoul256
	"autocmd BufEnter *.txt colorscheme nova
	"autocmd BufEnter *.py colorscheme gruvbox
	"autocmd BufEnter *.m colorscheme seoul256
    "autocmd BufEnter *.md colorscheme nova
	"autocmd BufEnter *.tex colorscheme nova
    "autocmd BufEnter *.html color nova
    "autocmd BufEnter *.js color gruvbox
    "autocmd BufEnter *.css color nova
    "autocmd BufEnter *.scm color gruvbox
    "autocmd BufEnter *.c color gruvbox
    "autocmd BufEnter *.cpp color gruvbox
    "autocmd BufEnter *.h color gruvbox
    "autocmd BufEnter *.clj color gruvbox
"augroup END

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
"autocmd BufEnter * call ncm2#enable_for_buffer()
"Actually independent of ncm2 plugin. Just code for QOL when using autocomplete
set completeopt=noinsert,menuone,noselect

let g:toggle_list_no_mappings = 1
let g:git_messenger_no_default_mappings = v:true

let g:indentLine_setColors = 0

"let g:indent_guides_enable_on_vim_startup = 1
"let g:gitgutter_sign_added = 'a'
"let g:gitgutter_sign_modified = 'm'
"let g:gitgutter_sign_removed = 'r'
"let g:gitgutter_sign_modified_removed = 'mr'
let g:gitgutter_map_keys = 0

let g:enable_bold_font = 1


let g:processing_no_default_mappings = 1

"let g:mta_filetypes = {
    "\ 'html' : 1,
    "\ 'xhtml' : 1,
    "\ 'xml' : 1,
    "\ 'jinja' : 1,
    "\ 'vue' : 1,
    "\}

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
"let g:slime_target = "tmux"
"let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":0.1"}
"let g:slime_paste_file = "$HOME/.slime_paste"
"let g:slime_no_mappings = 1
"let g:slime_python_ipython = 1
"let g:slime_dont_ask_default = 1
"let g:instant_markdown_slow=1
"Converting markdown to pdf
"autocmd BufWritePost *.md !markdown-pdf % -o %.pdf
"let g:vimwiki_hl_headers = 1

let g:UltiSnipsExpandTrigger = "zz" 
let g:UltiSnipsJumpForwardTrigger = "<leader><leader>"
let g:UltiSnipsJumpBackwardTrigger = "<c-j>"

"let g:mkdp_path_to_chrome = "firefox"
"let g:mkdp_auto_start = 0
"let g:mkdp_auto_close = 0
"let g:mkdp_refresh_slow = 1

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
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_symbols.maxlinenr
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7

let g:ackprg = 'ag --vimgrep --ignore=tags'

let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffCommand = "diff"


"nnoremap <C-j> <C-W><C-j>
"nnoremap <C-k> <C-W><C-k>
"nnoremap <C-l> <C-W><C-l>
"nnoremap <C-h> <C-W><C-h>

let g:promptline_preset = {
        \'a' : [ promptline#slices#conda_env(),promptline#slices#cwd({'dir_limit':1}) ],
        \'b' : [ promptline#slices#vcs_branch(),promptline#slices#git_status() ],}
" \'b' : [ promptline#slices#cwd({'dir_limit':1}) ],
" \'y' : [ promptline#slices#git_status() ]}
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

"SourceIfExists(~/.vim_config)
source ~/.vim_config
"this only works when calling vimdiff from command line
"so its useless for comparing different versions with git
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

"For tmux runner
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
let g:VtrClearBeforeSend = 0

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages. I will set back to 1 for now
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"" Or use `complete_info` if your vim support it, like:
"" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


"" Remap keys for gotos
" nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>ct <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)


"" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)

"" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

"" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader><leader>f  :call CocAction('format')<CR>
"autocmd BufWritePre :call CocAction('format')<CR>

"augroup mygroup
  "autocmd!
  "" Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

"" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

"" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)


"" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" nn <silent><buffer> <C-l> :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
" nn <silent><buffer> <C-k> :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
" nn <silent><buffer> <C-j> :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
" nn <silent><buffer> <C-h> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>
nn <leader>ci :CocInfo<CR>
nn <leader>cl :CocOpenLog<CR>
nnoremap <leader>cd :CocCommand workspace.showOutput<CR>

" Make sure to use tabs
" set autoindent
" set noexpandtab
" set tabstop=4
" set shiftwidth=4

" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"

autocmd FileType json syntax match Comment +\/\/.\+$+
" autocmd BufReadPre,FileReadPre * :set background=dark
