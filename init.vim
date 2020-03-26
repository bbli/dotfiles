set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

tnoremap ;c <C-\><C-n>
source ~/.vimrc
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
