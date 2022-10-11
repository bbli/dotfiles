set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" Only available in neovim
set inccommand=nosplit
" ************** Helper Functions **************%%%1
lua << EOF
P = function(v)
        print(vim.inspect(v))
        return
    end
EOF
nnoremap <leader><leader>e :source %<CR>

" ************  Neovim 0.5 Specific Plugins  ************%%%1
lua << EOF
require('packer').startup(function()
use '~/Desktop/random_things/lua_plugin'
-- Packer can manage itself
use 'wbthomason/packer.nvim'
-- ************  UTILITY LIBRARIES  ************ %%%2
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
-- ************  Workflows  ************ %%%2
use {'nvim-telescope/telescope.nvim',
    config = function() require("plugins.telescope") end,
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
use {'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    config = function() require("plugins.telescope-fzf-native") end,
    after = 'telescope.nvim',
    requires = {'nvim-telescope/telescope.nvim'}
    }
--use {'GustavoKatel/telescope-asynctasks.nvim',
--  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope.nvim'}}
--  }

use {"AckslD/nvim-neoclip.lua", 
    config = function () require("plugins.nvim-neoclip") end,
    requires = {
        {'tami5/sqlite.lua', module = 'sqlite'},
        {'nvim-telescope/telescope.nvim'},
    },
}

--use {'stevearc/qf_helper.nvim'} --location tracking not working atm, but useful for toggling with no entries

-- the issue with harpoon is that I need to show it on some UI
-- use {'thePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim'}
-- ************  Motions  ************ %%%2
use {"ggandor/lightspeed.nvim", 
    config = function() require("plugins.lightspeed") end,
}

-- ************  LSP STUFF  ************ %%%2
-- TODO: check that mason-lspconfig works on mac, where language servers made not be installed?
use {"williamboman/mason.nvim",
    config = function() require("plugins.mason") end,
}
use {"williamboman/mason-lspconfig.nvim",
    config = function() require("plugins.mason-lspconfig") end,
    after = 'mason.nvim',
}
use {'neovim/nvim-lspconfig',
    config = function() require("plugins.nvim-lspconfig") end,
    after = 'mason-lspconfig.nvim',
}
-- use 'ldelossa/calltree.nvim'
use 'andersevenrud/cmp-tmux'
use'hrsh7th/cmp-nvim-lsp'
use'hrsh7th/cmp-buffer'
use'hrsh7th/cmp-path' -- kinda useless
use'hrsh7th/cmp-cmdline' -- also kinda useless
--  use 'hrsh7th/cmp-vsnip' -- make lsp status not show warnings
--  use 'hrsh7th/vim-vsnip'
use {'hrsh7th/nvim-cmp',
    config = function() require("plugins.nvim-cmp") end,
}
use {'quangnguyen30192/cmp-nvim-tags', requires = 'hrsh7th/nvim-cmp' }
  --use {'tzachar/cmp-fuzzy-buffer', requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}}

use {'onsails/lspkind-nvim'}
--use 'glepnir/lspsaga.nvim'
use {'kosayoda/nvim-lightbulb',
    config = function() require("plugins.nvim-lightbulb") end,
}
use 'simrat39/rust-tools.nvim'
use {'bbli/nvim-code-action-menu',
    config = function() require("plugins.nvim-code-action-menu") end,
}
--use "ray-x/lsp_signature.nvim" "I prefer snippet solution better as it doesn't clutter the above line
-- tagbar/vista is better b/c it shows the current hovered function
--use 'simrat39/symbols-outline.nvim'
-- ************  TREE SITTER  ************ %%%2
use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.nvim-treesitter') end,
    run = ':TSUpdate'
    }
use 'nvim-treesitter/nvim-treesitter-textobjects'
--use 'haringsrob/nvim_context_vt'
-- use 'RRethy/nvim-treesitter-textsubjects'
--use 'mizlan/iswap.nvim'
--use 'JoosepAlviste/nvim-ts-context-commentstring'
use {'romgrk/nvim-treesitter-context',
    config = function() require('plugins.nvim-treesitter-context') end,
}
  -- ************  DEBUGGER  ************ %%%2
  --use 'mfussenegger/nvim-dap'
  --use 'mfussenegger/nvim-dap-python' --Actualy, supposedly vim-ultest will cover this?
  --use 'theHamsta/nvim-dap-virtual-text'
  --use 'nvim-telescope/telescope-dap.nvim'
  --use "Pocco81/DAPInstall.nvim"
  -- ************  GIT  ************ %%%2
  --use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'sindrets/diffview.nvim'
  -- ************  LUA PLUGIN DEVELOPMENT  ************ %%%2
  use 'euclidianAce/BetterLua.vim'
  use 'rafcamlet/nvim-luapad'
  use 'folke/lua-dev.nvim'
  -- ************  MISC/AESTHETICS  ************ %%%2
use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'}
use {'folke/todo-comments.nvim',
    config = function() require"plugins.todo-comments" end,
    requires = "nvim-lua/plenary.nvim"
    }
use 'windwp/nvim-autopairs'
use {
  "folke/zen-mode.nvim",
  config = function() require("zen-mode").setup { } end
}
  use {
      'kyazdani42/nvim-web-devicons', -- forgot which plugin is optionally dependent on this
      --config = function()
      --require('nvim-web-devicons').setup{default = true}
      --end
      }
  use 'folke/lsp-colors.nvim'
  use {'j-hui/fidget.nvim'} -- lsp status as virtual text at bottom left
  --use {
--      "folke/twilight.nvim",
 --     config = function() require("twilight").setup { } end
  --}
--use { 'pwntester/octo.nvim',
--  requires = {
--    'nvim-lua/plenary.nvim',
--    'nvim-telescope/telescope.nvim',
--    'kyazdani42/nvim-web-devicons',
--  },
--  config = function ()
--    require"octo".setup()
--  end
--} 
  end
)
EOF
" ************  Vimscript Functions  ************%%%1
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

" ************  Misc Neovim Specific Things  ************%%%1

"tnoremap ;c <C-\><C-n>
" number of old files needs to be set higher given I use vim as manpager
set shada='200
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" for treesitter
"luafile ~/.init.lua
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
"nnoremap <leader>lt :write | edit | TSBufEnable highlight


" autocmd BufDelete,BufWipeout *
"           \ call s:update_oldfiles(expand('<afile>:p'))

command! Scratch lua require'tools'.makeScratch()
"au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
" lua text will be syntax highlighted!
let g:vimsyn_embed = 'l'

" ************  LSP KeyMaps  ************%%%1

" Statusline

""set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
""set statusline^=%{StatuslineLsp()}

lua << EOF
--nah, as these don't have colors
--vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
--vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
--vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
--vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
EOF
"From: https://www.reddit.com/r/neovim/comments/l00zzb/improve_style_of_builtin_lsp_diagnostic_messages/
" Errors in Red
hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
" Warnings in Yellow
hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
" Info and Hints in White
hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White

" Underline the offending code
hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline
hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline

lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Enable underline, use default values
   underline = true,
   -- Enable virtual text only on Warning or above, override spacing to 2
   virtual_text = {
     spacing = 2,
     severity_limit = "Warning",
   },
--   virtual_text = false,
   signs = true,
   update_in_insert = false,
 }
)
EOF

"autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
nnoremap <unique> <leader>ot :Telescope<CR>

nnoremap <leader>jd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>js :vs<CR>:lua vim.lsp.buf.definition()<CR>
nnoremap <leader>jD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>jr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <leader>jr <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <leader>ji <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>je <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>jE <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

nnoremap <leader>fr <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>fs <cmd>Telescope tags<cr>

nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>jj <cmd>lua vim.lsp.buf.outgoing_calls()<CR>
nnoremap <leader>jR <cmd>lua vim.lsp.buf.incoming_calls()<CR> "though references is better -> will also show from test files too
" nnoremap K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <leader>k <cmd>lua vim.lsp.buf.signature_help()<CR> "Don't really understand this
" nnoremap <silent> ls <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

"nnoremap <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
"nnoremap <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
"Q: make autocmd on save since asynchronous? Nah since I want
"diagonistic errors and this will only delay
" ****Rest of Lanuage Server****

"nnoremap <leader>lt :write | edit | TSBufEnable highlight
" using indirection since TSBufEnable won't be available until vim fully finishes starting up
" -> Or can put this in an "after directory"?
let @T = "write | edit | TSBufEnable highlight"
nnoremap <leader>lc :<C-R>T<CR>
nnoremap <leader>lt :GutentagsUpdate!<CR>
nnoremap <leader>lf <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <unique> <leader><leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>ll <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <unique> <leader>ls :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
nnoremap <leader>lr :LspRestart<CR>
"--nnoremap <leader>fr <cmd>lua vim.lsp.buf.rename()<CR>
"nnoremap <leader>jt <cmd>lua vim.lsp.buf.type_definition()<CR> "What is this used for?
"nnoremap <leader>ct <cmd>lua vim.lsp.buf.outgoing_calls()<CR> "Just one level BFS
"
" auto-format
"autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
" nnoremap <leader>ca <cmd>Telescope lsp_code_actions<CR>
"nnoremap <leader>fc <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{prompt_prefix=" ", default_text=" :class: "}<CR>


" Sometimes cmp popup menu will not close
set completeopt=menu,menuone,noselect
inoremap <expr> <C-j> pumvisible() ?"<C-n>":"<C-j>"
inoremap <expr> <C-k> pumvisible() ?"<C-p>":"<C-k>"
" ************  Debugger  ************%%%1
" lua <<EOF
" --require('telescope').load_extension('dap') -- NOTE: needs to be called after telescope setup
" local dap = require('dap')
" dap.adapters.lldb = {
"   type = 'executable',
"   command = '/usr/bin/lldb-vscode', -- adjust as needed
"   name = "lldb"
" }
" dap.configurations.cpp = {
"   {
"     name = "Launch",
"     type = "lldb",
"     request = "launch",
"     program = function()
"       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
"     end,
"     cwd = '${workspaceFolder}',
"     stopOnEntry = false,
"     args = {},

"     runInTerminal = false,
"   },
" }
" dap.configurations.c = dap.configurations.cpp
" dap.configurations.rust = dap.configurations.cpp
" dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

" vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
" EOF
" au FileType dap-repl lua require('dap.ext.autocompl').attach()
" nnoremap <silent> <localleader>dc :lua require'dap'.continue()<CR>
" nnoremap <silent> <localleader>ds :lua require'dap'.step_over()<CR>
" nnoremap <silent> <localleader>di :lua require'dap'.step_into()<CR>
" nnoremap <silent> <localleader>do :lua require'dap'.step_out()<CR>
" nnoremap <silent> <localleader>db :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <localleader>dB :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <localleader>dp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <localleader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <localleader>dl :lua require'dap'.run_last()<CR>
" nnoremap <silent> <localleader>dq :lua require'dap'.stop()<CR>

":Telescope dap commands
":Telescope dap configurations
":Telescope dap list_breakpoints
":Telescope dap variables
":Telescope dap frames
"A typical debug flow consists of:
"1.Setting breakpoints via :lua require'dap'.toggle_breakpoint().
"2. Launching debug sessions and resuming execution via :lua require'dap'.continue().
"3. Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
"4. Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)

let g:dap_virtual_text = 'all_frames'
" ************  Diffview  ************%%%1
lua << EOF
local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
    use_icons = true,        -- Requires nvim-web-devicons
    diff_binaries = false,    -- Show diffs for binaries
    file_panel = {
        width = 35,
        },
    key_bindings = {
        disable_defaults = true,                   -- Disable the default key bindings
        -- The `view` bindings are active in the diff buffers, only when the current
        -- tabpage is a Diffview.
        view = {
            -- Use <leader>gn to go to next diff
            ["<leader>dn"]     = cb("select_next_entry"),  -- Open the diff for the next file 
            ["<leader>dN"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
            ["<leader>df"] = cb("focus_files"),        -- Bring focus to the files panel
            ["<leader>dd"] = cb("toggle_files"),       -- Toggle the files panel.
            },
        file_panel = {
            ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
            ["<down>"]        = cb("next_entry"),
            ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
            ["<up>"]          = cb("prev_entry"),
            ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
            ["o"]             = cb("select_entry"),
            ["<2-LeftMouse>"] = cb("select_entry"),
            ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
            ["S"]             = cb("stage_all"),          -- Stage all entries.
            ["U"]             = cb("unstage_all"),        -- Unstage all entries.
            ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
            ["<tab>"]         = cb("select_next_entry"),
            ["<s-tab>"]       = cb("select_prev_entry"),
            ["<leader>df"]     = cb("focus_files"),
            ["<leader>dd"]     = cb("toggle_files"),
            }
        }
    }
EOF

" ************** QuickFix **************%%%1
" nnoremap <leader>tq :QFToggle<CR>
lua << EOF
-- require('pqf').setup()
EOF
" ************** Compiling/Running/Terminal Interaction **************%%%1
" nnoremap <leader>pp <cmd>lua require('telescope').extensions.asynctasks.all()<CR>
" nnoremap <leader>pi <cmd>AsyncTaskMacro<CR>
" nnoremap <localleader>a :AsyncTaskEdit<CR>
" ************  Rest  ************%%%1
lua << EOF
require('nvim-web-devicons').setup{default = true}
require('nvim-autopairs').setup({
  enable_check_bracket_line = true,
disable_filetype = { "TelescopePrompt" , "guihua", "guihua_rust", "clap_input" },
})
require('trouble').setup{
}
--require("nvim-autopairs.completion.compe").setup({
--  map_cr = true, --  map <CR> on insert mode
--  map_complete = true -- it will auto insert `(` after select function or method item
--})
EOF
" Use for jumping to the current TODO -> in TDD
nnoremap <leader>ha <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>hs <cmd>lua require("harpoon.ui").nav_file(2)<CR>

nnoremap <leader>hh <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hj <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
" NOTE: 
" behavior
nnoremap <leader>oa <cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' , '-g', '!node_modules'}})<cr>
" nnoremap <leader>oa <cmd>Telescope find_files<cr>
nnoremap <leader>oo <cmd>Telescope git_files<cr>
"nnoremap <leader>ug <cmd>Telescope live_grep<cr>
nnoremap <leader>ob <cmd>Telescope buffers<cr>
nnoremap <leader>oh <cmd>Telescope oldfiles<cr>
" nnoremap <leader>oc <cmd>Telescope commands<cr>
nnoremap <M-;> <cmd>Telescope commands<cr>
" TODO: Telescope way better here compared to FZF b/c of preview  -> Harpoon will probably replace though
nnoremap <leader>ul <cmd>Telescope marks<cr>
"TODO: why is the below  not filtering?
nnoremap <leader>or <cmd>Telescope neoclip<cr>
nnoremap <leader>oy <cmd>Telescope neoclip<cr>
" nnoremap <leader>ok <cmd>Telescope keymaps<cr>

" These will check out the selected commit/branch
" nnoremap <leader>gb <cmd>Telescope git_branchs<CR>
" Fugitive is better this quickfix does nothing
" nnoremap <leader>gc <cmd>Telescope git_commits<CR>
nnoremap <leader>gD :DiffviewOpen

nnoremap <leader>ov <cmd>Telescope vim_options<cr>
nnoremap <leader>ok <cmd>Telescope keymaps<cr>
nnoremap <leader>om <cmd>Telescope help_tags<cr>
"Use after ripgrep for faster narrowing!
" nnoremap <leader>vv <cmd>Telescope quickfix<cr>
" nnoremap <leader>vl <cmd>Telescope loclist<cr>

nnoremap <leader>jd <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>ji <cmd>Telescope lsp_implementations<cr>

