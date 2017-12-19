set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if &compatible
  set nocompatible
endif
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim/

"call dein#begin('~/.nvim/plugged')
"
"call dein#add('Shougo/deoplete.nvim')
"call dein#add('simnalamburt/vim-mundo')
""call dein#add('bfredl/nvim-ipy')
"call dein#add('vimlab/split-term.vim')
"call dein#add('zchee/deoplete-jedi')
"
"call dein#end()
"call dein#save_state()


source ~/.vimrc

tnoremap ;c <C-\><C-n>
cnoremap SH terminal<CR>


let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"if (has("termguicolors"))
" set termguicolors
"endif

"colorscheme OceanicNext

let g:deoplete#enable_at_startup=1
