set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" Only available in neovim
set inccommand=nosplit
" TO INSPECT A LUA TABLE
" print(vim.inspect)
" ************  Neovim 0.5 Specific Plugins  ************{{{1
lua << EOF
require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
      }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
      'GustavoKatel/telescope-asynctasks.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope.nvim'}}
      }

 -- ************  UTILITY LIBRARIES  ************
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  -- ************  LSP STUFF  ************
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'andersevenrud/compe-tmux'
  use 'glepnir/lspsaga.nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'simrat39/rust-tools.nvim'
  use "ray-x/lsp_signature.nvim"
  -- tagbar/vista is better b/c it shows the current hovered function
  --use 'simrat39/symbols-outline.nvim'
  use 'anott03/nvim-lspinstall'
  use 'nvim-lua/lsp-status.nvim'
  -- ************  TREE SITTER  ************
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
      }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- use 'RRethy/nvim-treesitter-textsubjects'
  use 'mizlan/iswap.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- ************  DEBUGGER  ************
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python' --Actualy, supposedly vim-ultest will cover this?
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  --use "Pocco81/DAPInstall.nvim"
  -- ************  GIT  ************
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'sindrets/diffview.nvim'
  -- ************  MISC  ************
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

" ************  LSP configuration  ************{{{1

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
 }
)
EOF

"autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
nnoremap <unique> <leader>ot :Telescope<CR>

nnoremap <leader>jd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>jd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>jD <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <leader>jr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>jr <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <leader>ji <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>je <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>jE <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

nnoremap <leader>fr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <leader>fs <cmd>Telescope tags<cr>

"nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <leader>k <cmd>lua vim.lsp.buf.signature_help()<CR> "Don't really understand this
nnoremap <silent> ls <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

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
"--nnoremap <leader>fr <cmd>lua vim.lsp.buf.rename()<CR>
"nnoremap <leader>jt <cmd>lua vim.lsp.buf.type_definition()<CR> "What is this used for?
"nnoremap <leader>ct <cmd>lua vim.lsp.buf.outgoing_calls()<CR> "Just one level BFS
"
" auto-format
"autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
"nnoremap <leader>fc <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{prompt_prefix=" ", default_text=" :class: "}<CR>

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

lua << EOF
require "lsp_signature".setup()
EOF
" ************  Language Servers  ************{{{1
lua <<EOF
local lsp_status = require('lsp-status')
lsp_status.register_progress()
-- cmake
require'lspconfig'.cmake.setup{}
-- vimls
require'lspconfig'.vimls.setup{}
-- clangd
require'lspconfig'.clangd.setup{
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities,
    default_config = {
        cmd = {
            "clangd", "--background-index", "--suggest-missing-includes",
            -- "--pch-storage=memory", "--suggest-missing-includes"
            "-j=3",
        },
        filetypes = {"c", "cpp", "objc", "objcpp"},
        --root_dir = require"nvim_lsp/util".root_pattern("compile_commands.json", compile_flags.txt", .git"),
        init_option = {
            --clang = {
                fallbackFlags = {
                    "-std=c++17"} -- YEAH, STILL NOT WORKING
             --   }
        }
    }
}


-- Rust Tools
local opts = {
      on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities,
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,

        runnables = {
            use_telescope = true
            -- rest of the opts are forwarded to telescope
        },

        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",
        },

        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false
        }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        } -- rust-analyer options
}
require('rust-tools').setup(opts)


-- Lua Language Server
local sumneko_binary = "/usr/bin/lua-language-server"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
-- python
require'lspconfig'.pyright.setup{}

EOF
" ************  TreeSitter  ************{{{1
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        --custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            -- ["keyword"] = "TSString", -- for testing if tresitter works
            --},
        additional_vim_regex_highlighting = false,
    },
--  context_commentstring = {
--    enable = true
--  },
incremental_selection = {
enable = true,
keymaps = {
    init_selection = "gnn",
    node_incremental = "grn",
    scope_incremental = "grc",
    node_decremental = "grm",
    },
},
  indent = {
  enable = true
  },
  -- since I don't use operator pending that often/when I do want exact
     -- textsubjects = {
     -- enable = true,
     -- keymaps = {
     --     ['t'] = 'textsubjects-smart',
     --     ['T'] = 'textsubjects-container-outer',
     --     }
     -- },
 textobjects = {
     select = {
     enable = true,
     lookahead = true,

     keymaps = {
         ["af"] = "@function.outer",
         ["if"] = "@function.inner",
         ["ac"] = "@class.outer",
         ["ic"] = "@class.inner",
         ["ab"] = "@block.outer",
         ["ib"] = "@block.inner",
         },
     },

 move = {
 enable = true,
 set_jumps = true, -- whether to set jumps in the jumplist
 goto_next_start = {
     ["lf"] = "@function.outer",
     ["ll"] = "@comment.outer",

     ["C-n"] = "@statement.outer",
     ["lc"] = "@class.outer",
     },
 goto_previous_start = {
     ["hh"] = "@comment.outer",
     ["hf"] = "@function.outer",

     ["C-p"] = "@statement.outer",
     ["hc"] = "@class.outer",
     },
 -- below don't matter as much
 goto_next_end = {
     ["lL"] = "@statement.outer",
     ["lF"] = "@function.outer",

     --["lC"] = "@comment.outer",
     ["lC"] = "@class.outer",
     },
 goto_previous_end = {
     ["[M"] = "@function.outer",
     ["[]"] = "@class.outer",
     },
 },
  context_commentstring = {
    enable = true
  },
  },
}
EOF
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
" ************  Telescope  ************{{{1
lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
          [ "q" ] = actions.close,
          ["<C-f>"] = actions.preview_scrolling_up,
          ["<C-b>"] = actions.preview_scrolling_down,
      },
     i = {
          [ "<C-g>" ] = actions.close,
          [ "<C-j>" ] = actions.move_selection_next,
          [ "<C-k>" ] = actions.move_selection_previous,
          [ "<C-l>" ] = actions.smart_send_to_qflist + actions.open_qflist,
          [ "<C-h>" ] = actions.complete_tag,
          [ "<C-u>" ] = false,
          [ "<C-d>" ] = false,
          [ "<C-b>" ] = actions.preview_scrolling_up,
          [ "<C-f>" ] = actions.preview_scrolling_down,

     },
    },
      layout_config = {
          preview_width = 75
      }
  },
   extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')
EOF
" ************  Debugger  ************{{{1
lua <<EOF
--require('telescope').load_extension('dap') -- NOTE: needs to be called after telescope setup
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    runInTerminal = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
EOF
au FileType dap-repl lua require('dap.ext.autocompl').attach()
nnoremap <silent> <localleader>dc :lua require'dap'.continue()<CR>
nnoremap <silent> <localleader>ds :lua require'dap'.step_over()<CR>
nnoremap <silent> <localleader>di :lua require'dap'.step_into()<CR>
nnoremap <silent> <localleader>do :lua require'dap'.step_out()<CR>
nnoremap <silent> <localleader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <localleader>dB :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <localleader>dp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <localleader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <localleader>dl :lua require'dap'.run_last()<CR>
nnoremap <silent> <localleader>dq :lua require'dap'.stop()<CR>
"TODO create command for running to cursor?

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
" ************  Diffview  ************{{{1
lua << EOF
local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  file_panel = {
    width = 35,
    use_icons = true        -- Requires nvim-web-devicons
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
" ************** Compiling/Running/Terminal Interaction **************{{{1
nnoremap <leader>pp <cmd>lua require('telescope').extensions.asynctasks.all()<CR>
nnoremap <leader>pi <cmd>AsyncTaskMacro<CR>
nnoremap <localleader>a :AsyncTaskEdit<CR>
" ************  Rest  ************{{{1
lua << EOF
require('nvim-web-devicons').setup{default = true}
require('nvim-autopairs').setup({
  enable_check_bracket_line = true
})
--require("nvim-autopairs.completion.compe").setup({
--  map_cr = true, --  map <CR> on insert mode
--  map_complete = true -- it will auto insert `(` after select function or method item
--})
EOF
" ************  TODO  ************{{{1
nnoremap <silent> <A-t> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-t> <C-\><C-n>:Lspsaga close_floaterm<CR>
" TODO: better than fzf but I seriously need to change the locking
" behavior
nnoremap <leader>oa <cmd>Telescope find_files<cr>
nnoremap <leader>oo <cmd>Telescope git_files<cr>
"nnoremap <leader>ug <cmd>Telescope live_grep<cr>
nnoremap <leader>ob <cmd>Telescope buffers<cr>
nnoremap <leader>oh <cmd>Telescope oldfiles<cr>
nnoremap <leader>oc <cmd>Telescope commands<cr>
nnoremap <M-;> <cmd>Telescope commands<cr>
" TODO: Telescope way better here compared to FZF b/c of preview  -> Harpoon will probably replace though
nnoremap <leader>ul <cmd>Telescope marks<cr>
"TODO: why is this not filtering?
nnoremap <leader>or <cmd>Telescope registers<cr>
nnoremap <leader>om <cmd>Telescope help_tags<cr>

" These will check out the selected commit/branch
nnoremap <leader>gb <cmd>Telescope git_branchs<CR>
nnoremap <leader>gc <cmd>Telescope git_commits<CR>
nnoremap <leader>gD :DiffviewOpen

nnoremap <leader>vo <cmd>Telescope vim_options<cr>
nnoremap <leader>vc <cmd>Telescope autocommands<cr>
nnoremap <leader>vk <cmd>Telescope keymaps<cr>
nnoremap <leader>vm <cmd>Telescope help_tags<cr>
"Use after ripgrep for faster narrowing!
nnoremap <leader>vv <cmd>Telescope quickfix<cr>
nnoremap <leader>vl <cmd>Telescope loclist<cr>

nnoremap <leader>jd <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>ji <cmd>Telescope lsp_implementations<cr>
