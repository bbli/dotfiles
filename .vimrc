set nocompatible
set hidden
set showcmd "To show keys pressed in normal mode; useful for completing Vim sentences
filetype plugin on
filetype on
syntax on
"set cindent
set hlsearch
set incsearch
set laststatus=2
set t_Co=256
set foldenable
set foldlevel=0
set foldmethod=manual
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
"Not needed as I am not using terminalguicolors, as downgrade solarzied is ok
"for me
"Plug 'godlygeek/csapprox' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
"Files
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
""Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Terminal Interactions
Plug 'benmills/vimux'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Latex
Plug 'lervag/vimtex'
Plug 'brennier/quicktex'
"Motion
"Plug 'easymotion/vim-easymotion'
"Plug 'tpope/vim-repeat'
"Markdown stuff
Plug 'mmai/vim-markdown-wiki'
Plug 'jtratner/vim-flavored-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
""Plug 'gabrielelana/vim-markdown'
"Undo
Plug 'mbbill/undotree'
""Plug 'chrisbra/histwin.vim'idk what extra features this has over undotree
""Python
""Plug 'davidhalter/jedi-vim' "Only needed for neovim deoplete
""Plug 'Valloric/YouCompleteMe'
""Misc
"Plug 'tpope/vim-obsession'
"Plug 'kannokanno/previm'
"Plug 'tyru/open-browser.vim'
"Plug 'vim-scripts/Gundo' Requires vim to be compile with python2
"Plug 'vimwiki/vimwiki'

"Syntax
"Plug 'suan/vim-instant-markdown'
"Plug 'reedes/vim-wordy'
"Plug 'rhysd/vim-grammarous'
"Plug 'tpope/vim-dispatch'
Plug 'jiangmiao/auto-pairs'
Plug 'metakirby5/codi.vim'

if has('nvim')
	Plug 'simnalamburt/vim-mundo'
	Plug 'vimlab/split-term.vim'
"Plug 'Shougo/denite.nvim'
endif
call plug#end()

if !has('nvim')
	set ttymouse=xterm2
endif

"Making ALt usable on Linux
for i in range(97,122)
	  let c = nr2char(i)
	    exec "map \e".c." <M-".c.">"
		  exec "map! \e".c." <M-".c.">"
	  endfor

"""Leader maps must be defined after this command.
let mapleader=" "
let maplocalleader="-"

""""""""Leader Keys""""""""
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>b :e ~/.bashrc<CR>
nnoremap <leader>m :Magit<CR>
nnoremap <leader>g :e ~/.gitconfig<CR>

nnoremap <leader>zz :nohlsearch<CR>
nnoremap <leader>f :set foldmethod=indent<CR> <bar> :set foldlevel=0<CR>
nnoremap <leader>o :set foldlevel=5<CR>
nnoremap <leader><leader>f :set foldmethod=indent<CR> <bar> :set foldlevel=1<CR>

"To move to next sentence
nnoremap <leader>s )
nnoremap <leader>S (

nnoremap <leader>p :FZF<CR>
nnoremap <leader><leader>p :FZF ../<CR>
nnoremap <leader>h :FZF /home/benson<CR>
cnoremap FF FZF
"For some reason, I had to use W instead of w to get this mapping to work"
vnoremap <leader>y "+y

autocmd BufEnter *.py  nnoremap <buffer> <leader>c I#<esc>
autocmd BufEnter *.m  nnoremap <buffer> <leader>c I%<esc>
""""""""Local Leader Keys""""""""
nnoremap <localleader>vp :VimuxPromptCommand<CR>
nnoremap <localleader>r :VimuxRunLastCommand<CR>
nnoremap <localleader>vs :VimuxInterruptRunner<CR>

nnoremap <localleader>ww :MarkdownPreview<CR>
nnoremap <localleader>wc :MarkdownPreviewStop<CR>

nnoremap <localleader>e :!python % <CR>

nnoremap <localleader>t <C-W>T
""""""""Meta Keys""""""""
"To move lines intuitively
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv


nnoremap <M-m> qh
nnoremap <M-h> @h 
"nnoremap <C-n> @m 
"nnoremap <M-n> dd


""""""""Fn Keys""""""""
nnoremap <F2> :AirlineToggleWhitespace<CR>
nnoremap <F3> :set nospell<CR>
nnoremap <F4> :setlocal spell  spelllang=en_us<CR>
nnoremap <F5> :GrammarousCheck<CR>
nnoremap <F6> :MundoToggle<CR>
nnoremap <F7> :UndotreeToggle<CR>
nnoremap <silent> <F8> :NERDTreeToggle<CR>

""""""""Semi Colon Keys""""""""
inoremap ;c <C-c>
vnoremap ;c <C-c>
nnoremap ;q :q<CR>
nnoremap ;w <C-c>:w<CR>
inoremap ;w <C-c>:w<CR>
vnoremap ;w <C-c>:w<CR>
nnoremap ;n :bn<CR>
"nnoremap ;;n :2bn<CR>
"nnoremap ;;N :2bp<CR>
nnoremap ;N :bp<CR>
nnoremap ;d :bwipeout<CR>
nnoremap ;; ;

nnoremap ;r @:

""""""""Normal Mode maps""""""""
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
nnoremap EE @
nnoremap C c$
nnoremap D d$
nnoremap Y y$
nnoremap gb gi
nnoremap w W
nnoremap W w
nnoremap b B
nnoremap B b


""""""""Command Mode maps""""""""
cnoremap sE %s
"For grep
cnoremap cn cnext
cnoremap cN cprev
cnoremap SB set scrollbind
cnoremap NSB set noscrollbind
cnoremap tc tabc
cnoremap vsb vertical sb


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


""""""""Colors""""""""
"makes vim colorscheme the same as the terminal
"set termguicolors 
"Makes a solarized approximation for vim
let g:solarized_termcolors=256
color seoul256
augroup filetype_color
	autocmd!
	autocmd FileType text color seoul256
	autocmd FileType vim color seoul256
	autocmd FileType matlab color seoul256
	autocmd FileType python color Tomorrow-Night-Eighties
	autocmd FileType markdown set background=light
	autocmd FileType markdown color gruvbox
	autocmd FileType latex color seoul256
augroup END

augroup buffer_color
	autocmd!
	autocmd BufEnter vim colorscheme seoul256
	autocmd BufEnter *.txt colorscheme seoul256
	autocmd BufEnter *.py colorscheme Tomorrow-Night-Eighties
	autocmd BufEnter *.m colorscheme seoul256
	autocmd BufEnter *.md set background=light
	autocmd BufEnter *.md colorscheme gruvbox
	autocmd BufEnter *.tex colorscheme seoul256
augroup END

""""""""Other Autocommands""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown "Make vim recognize .md as markdown file
" Makes folds persistent through vim sessions. Note this will cause a warning

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
"Makes sure tex files are read as latex type
let g:tex_flavor = 'latex'
let g:vimtex_mappings_enabled=0
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

let g:ackprg = 'ag --vimgrep'

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

"let g:previm_open_cmd='open -a Firefox'
"augroup PrevimSettings
"        autocmd!
"	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"augroup END


" vimwiki: Note I really didn't use the attributes 
"let wiki_1 = {}
"let wiki_1.path = '~/Desktop/Notes/Math/Abstract_Algebra'
"let wiki_2 = {}
"let wiki_2.path = '~/Desktop/Notes'
"let g:vimwiki_list = [{'path': '~/Desktop/Notes/', 'auto_toc': 1,'syntax': 'markdown','ext': '.md'},{'path': '~/Desktop/Notes/Math/Abstract_Algebra', 'auto_toc': 1,'syntax': 'markdown','ext': '.md'}]

"let g:tmuxline_preset = {
"	\'a'       : '#S',
"	\'b'       : '#W',
"	\'win'     : '#I #W',
"	\'cwin'    : '#I #W',
"	\'x'       : '%a',
"	\'y'       : '#W %R',
"	\'z'       : '#H',
"	\'options' : {'status-justify' : 'left'}}
"
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
"
"autocmd BufWritePost *.tex Dispatch! latexmk -pdf %
let g:quicktex_tex = {
    \' '   : "\<ESC>/<+.*+>\<CR>\"_c/+>/e\<CR>",
    \'maa'   : '\( <+++> \) <++>',
    \'prf' : "\\begin{proof}\<CR><+++>\<CR>\\end{proof}",
    \}

let g:quicktex_math = {
    \' ' : "\<ESC>/<+.*+>\<CR>\"_c/+>/e\<CR>",
\'Section: Lowercase Greek Letters' : 'COMMENT',
    \'alpha'   : '\alpha ',
    \'ga'      : '\alpha ',
    \'beta'    : '\beta ',
    \'gamma'   : '\gamma ',
    \'delta'   : '\delta ',
    \'epsilon' : '\epsilon ',
    \'ge'      : '\varepsilon ',
    \'zeta'    : '\zeta ',
    \'eta'     : '\eta ',
    \'theta'   : '\theta ',
    \'iota'    : '\iota ',
    \'kappa'   : '\kappa ',
    \'lambda'  : '\lambda ',
    \'gl'      : '\lambda ',
    \'mu'      : '\mu ',
    \'nu'      : '\nu ',
    \'xi'      : '\xi ',
    \'omega'   : '\omega ',
    \'pi'      : '\pi ',
    \'rho'     : '\rho ',
    \'sigma'   : '\sigma ',
    \'tau'     : '\tau ',
    \'upsilon' : '\upsilon ',
    \'gu'      : '\upsilon ',
    \'phi'     : '\varphi ',
    \'chi'     : '\chi ',
    \'psi'     : '\psi ',
    \
\'Section: Uppercase Greek Letters' : 'COMMENT',
    \'Alpha'   : '\Alpha ',
    \'Beta'    : '\Beta ',
    \'Gamma'   : '\Gamma ',
    \'Delta'   : '\Delta ',
    \'Epsilon' : '\Epsilon ',
    \'Zeta'    : '\Zeta ',
    \'Eta'     : '\Eta ',
    \'Theta'   : '\Theta ',
    \'Iota'    : '\Iota ',
    \'Kappa'   : '\Kappa ',
    \'Lambda'  : '\Lambda ',
    \'Mu'      : '\Mu ',
    \'Nu'      : '\Nu ',
    \'Xi'      : '\Xi ',
    \'Omega'   : '\Omega ',
    \'Pi'      : '\Pi ',
    \'Rho'     : '\Rho ',
    \'Sigma'   : '\Sigma ',
    \'Tau'     : '\Tau ',
    \'Upsilon' : '\Upsilon ',
    \'Phi'     : '\Phi ',
    \'Chi'     : '\Chi ',
    \'Psi'     : '\Psi ',
    \
\'Section: Set Theory' : 'COMMENT',
    \'bn'    : '\mathbb{N} ',
    \'bz'    : '\mathbb{Z} ',
    \'bq'    : '\mathbb{Q} ',
    \'br'    : '\mathbb{R} ',
    \'bc'    : '\mathbb{C} ',
    \'ba'    : '\mathbb{A} ',
    \'bf'    : '\mathbb{F} ',
    \'subs'  : '\subseteq ',
    \'in'    : '\in ',
    \'nin'   : '\not\in ',
    \'cup'   : '\cup ',
    \'cap'   : '\cap ',
    \'union' : '\cup ',
    \'sect'  : '\cap ',
    \'smin'  : '\setminus ',
    \'set'   : '\{<+++>\} <++>',
    \'empty' : '\varnothing ',
    \'pair'  : '(<+++>, <++>) <++>',
    \'dots'  : '\dots ',
    \
\'Section: Logic' : 'COMMENT',
    \'exists'  : '\exists ',
    \'nexists' : '\nexists ',
    \'forall'  : '\forall ',
    \'implies' : '\implies ',
    \'iff'     : '\iff ',
    \
\'Section: Relations' : 'COMMENT',
    \'lt'      : '< ',
    \'gt'      : '> ',
    \'leq'     : '\leq ',
    \'geq'     : '\geq ',
    \'eq'      : '= ',
    \'nl'      : '\nless ',
    \'ng'      : '\ngtr ',
    \'nleq'    : '\nleq ',
    \'ngeq'    : '\ngeq ',
    \'neq'     : '\neq ',
    \'neg'     : '\neg ',
    \
\'Section: Operations' : 'COMMENT',
    \'add'   : '+ ',
    \'min'   : '- ',
    \'frac'  : '\frac{<+++>}{<++>} <++>',
    \'recip' : '\frac{1}{<+++>} <++>',
    \'dot'   : '\cdot ',
    \'mult'  : '* ',
    \'exp'   : "\<BS>^{<+++>} <++>",
    \'pow'   : "\<BS>^{<+++>} <++>",
    \'sq'    : "\<BS>^2 ",
    \'inv'   : "\<BS>^{-1} ",
    \'cross' : '\times ',
    \
\'Section: Delimiters' : 'COMMENT',
    \'bpara' : '\left( <+++> \right) <++>',
    \'para'  : '(<+++>) <++>',
    \'bsb'   : '\left[ <+++> \right] <++>',
    \'sb'    : '[<+++>] <++>',
    \'bbra'  : '\left\{ <+++> \right\} <++>',
    \'bra'   : '\{<+++>\} <++>',
    \
\'Section: Group Theory' : 'COMMENT',
    \'sdp'   : '\rtimes ',
    \'niso'  : '\niso ',
    \'subg'  : '\leq ',
    \'nsubg' : '\trianglelefteq ',
    \'mod'   : '/ ',
    \
\'Section: Functions' : 'COMMENT',
    \'to'     : '\to ',
    \'mapsto' : '\mapsto ',
    \'comp'   : '\circ ',
    \'of'     : "\<BS>(<+++>) <++>",
    \'sin'    : '\sin{<+++>} <++>',
    \'cos'    : '\cos{<+++>} <++>',
    \'tan'    : '\tan{<+++>} <++>',
    \'gcd'    : '\gcd(<+++> ,<++>) <++>',
    \'ln'     : '\ln{<+++>} <++>',
    \'log'    : '\log{<+++>} <++>',
    \'df'     : '<+++> : <++> \to <++>',
    \'sqrt'   : '\sqrt{<+++>} <++>',
    \'case'   : '\begin{cases} <+++> \end{cases} <++>',
    \
\'Section: LaTeX commands' : 'COMMENT',
    \'sub'    : "\<BS>_{<+++>} <++>",
    \'sone'   : "\<BS>_1 ",
    \'stwo'   : "\<BS>_2 ",
    \'sthree' : "\<BS>_3 ",
    \'sfour'  : "\<BS>_4 ",
    \'text'   : '\text{<+++>} <++>',
    \
\'Section: Fancy Variables' : 'COMMENT',
    \'fA' : '\mathcal{A} ',
    \'fo' : '\mathcal{O} ',
    \'fn' : '\mathcal{N} ',
    \'fp' : '\mathcal{P} ',
    \'ft' : '\mathcal{T} ',
    \'fc' : '\mathcal{C} ',
    \'fm' : '\mathcal{M} ',
    \'ff' : '\mathcal{F} ',
    \'fz' : '\mathcal{Z} ',
    \'fi' : '\mathcal{I} ',
    \'fb' : '\mathcal{B} ',
    \'fl' : '\mathcal{L} ',
    \'fv' : '\mathcal{V} ',
    \
\'Section: Encapsulating keywords' : 'COMMENT',
    \'bar'  : "\<ESC>F a\\overline{\<ESC>f i} ",
    \'tild' : "\<ESC>F a\\tilde{\<ESC>f i} ",
    \'hat'  : "\<ESC>F a\\hat{\<ESC>f i} ",
    \'star' : "\<BS>^* ",
    \'vec'  : "\<ESC>F a\\vec{\<ESC>f i} ",
    \
\'Section: Linear Algebra' : 'COMMENT',
    \'GL'     : '\text{GL} ',
    \'SL'     : '\text{SL} ',
    \'com'    : "\<BS>^c ",
    \'matrix' : "\<CR>\\begin{bmatrix}\<CR><+++>\<CR>\\end{bmatrix}\<CR><++>",
    \'vdots'  : '\vdots & ',
    \'ddots'  : '\ddots & ',
    \
\'Section: Constants' : 'COMMENT',
    \'aleph' : '\aleph ',
    \'inf'   : '\infty ',
    \'one'   : '1 ',
    \'zero'  : '0 ',
    \'two'   : '2 ',
    \'three' : '3 ',
    \'four'  : '4 ',
    \
\'Section: Operators' : 'COMMENT',
    \'int'    : '\int <+++> \mathop{d <++>} <++>',
    \'dev'    : '\frac{d}{d <+++>} <++>',
    \'lim'    : '\lim_{<+++>} <++>',
    \'sum'    : '\sum ',
    \'prod'   : '\prod ',
    \'limsup' : '\limsup ',
    \'liminf' : '\liminf ',
    \'sup'    : '\sup ',
    \'sinf'   : '\inf ',
\}

