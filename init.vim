set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"tnoremap ;c <C-\><C-n>
" number of old files needs to be set higher given I use vim as manpager
set shada='200
source ~/.vimrc
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" for treesitter
luafile ~/.init.lua
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
"nnoremap <leader>lt :write | edit | TSBufEnable highlight

" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"

" No point since this is default behavior anyways
" Aka existing vim instance will not be updated b/c it
" only reads once during startup
" function! s:update_oldfiles(file)
"   if g:startify_locked || !exists('v:oldfiles')
"     return
"   endif
"   let idx = index(v:oldfiles, a:file)
"   if idx != -1
"     call remove(v:oldfiles, idx)
"   endif
"   call insert(v:oldfiles, a:file, 0)
" endfunction

" autocmd BufDelete,BufWipeout *
"           \ call s:update_oldfiles(expand('<afile>:p'))

