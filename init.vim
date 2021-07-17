set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" ************  Neovim 0.5 Specific Plugins  ************{{{1
lua << EOF
require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP STUFF
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'glepnir/lspsaga.nvim'
  use 'kosayoda/nvim-lightbulb'
  -- tag bar is better b/c it shows the current hovered function
  --use 'simrat39/symbols-outline.nvim'
  --use 'mattn/vim-lsp-settings'
  use {
  'nvim-lua/lsp-status.nvim',
   config = function()
       local lsp_status = require('lsp-status')
       lsp_status.register_progress()
   end
  }

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use {
      "folke/zen-mode.nvim",
      config = function() require("zen-mode").setup { } end
    }
  --use {
--      "folke/twilight.nvim",
 --     config = function() require("twilight").setup { } end
  --}
  end
)
EOF


" ************  Vimscript Functions  ************{{{1
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

" ************  Misc Neovim Specific Things  ************{{{1

"tnoremap ;c <C-\><C-n>
" number of old files needs to be set higher given I use vim as manpager
set shada='200
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" for treesitter
luafile ~/.init.lua
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
"nnoremap <leader>lt :write | edit | TSBufEnable highlight


" autocmd BufDelete,BufWipeout *
"           \ call s:update_oldfiles(expand('<afile>:p'))

command! Scratch lua require'tools'.makeScratch()
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
" lua text will be syntax highlighted!
let g:vimsyn_embed = 'l'

" ************  LSP configuration  ************{{{1

" Statusline
"function! LspStatus() abort
  "if luaeval('#vim.lsp.buf_get_clients() > 0')
    "return luaeval("require('lsp-status').status()")
  "endif

  "return ''
"endfunction
"set statusline^=%{LspStatus()}
lua << EOF
local lsp_status = require('lsp-status')

lsp_status.config({
  kind_labels = vim.g.completion_customize_lsp_label
})
lsp_status.register_progress()

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client)
end

require('lspconfig').rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
}
EOF

"function! StatuslineLsp() abort
  "return luaeval("require('lsp-status').status()")
"endfunction

""set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
""set statusline^=%{StatuslineLsp()}


nnoremap <leader>jd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>jD <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <leader>jr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>jr <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <leader>ji <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>je <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>jE <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

"nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <leader>k <cmd>lua vim.lsp.buf.signature_help()<CR> "Don't really understand this
nnoremap <silent> ls <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

"nnoremap <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
"nnoremap <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
"Q: make autocmd on save since asynchronous? Nah since I want
"diagonistic errors and this will only delay
nnoremap <leader>lf <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>ll <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
"nnoremap <leader>fr <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent>fr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <leader>fs <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"nnoremap <leader>jt <cmd>lua vim.lsp.buf.type_definition()<CR> "What is this used for?
"nnoremap <leader>ct <cmd>lua vim.lsp.buf.outgoing_calls()<CR> "Just one level BFS
"
" auto-format
"autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
let g:symbols_outline = {
    \ "highlight_hovered_item": v:false,
    \ "show_guides": v:true,
    \ "position": 'right',
    \ "auto_preview": v:false,
    \ "show_numbers": v:false,
    \ "show_relative_numbers": v:false,
    \ "show_symbol_details": v:true,
    \ "keymaps": {
        \ "close": "<Esc>",
        \ "goto_location": "<Cr>",
        \ "focus_location": "o",
        \ "hover_symbol": "<C-space>",
        \ "rename_symbol": "r",
        \ "code_actions": "a",
    \ },
    \ "lsp_blacklist": [],
\ }

" ************  AutoComplete  ************{{{1
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = {priority = 3};
    buffer = {priority = 99};
    calc = false;
    nvim_lsp = {priority = 5};
    nvim_lua = true;
    vsnip = false;
    ultisnips = false;
    luasnip = false;
    tmux = {priority = 1};
  };
}
EOF
" ************  TODO  ************{{{1
nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>
