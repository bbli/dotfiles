set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" ************  Neovim 0.5 Specific Plugins  ************{{{1
lua << EOF
require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

 -- UTILITY
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  -- LSP STUFF
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'glepnir/lspsaga.nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'simrat39/rust-tools.nvim'
  -- tagbar/vista is better b/c it shows the current hovered function
  --use 'simrat39/symbols-outline.nvim'
  use {
  'nvim-lua/lsp-status.nvim',
   config = function()
       local lsp_status = require('lsp-status')
       lsp_status.register_progress()
   end
  }
  -- TREE SITTER
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
      }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
      }

  -- Debugger
  use 'mfussenegger/nvim-dap'
  -- MISC
  use {
      "folke/zen-mode.nvim",
      config = function() require("zen-mode").setup { } end
    }
  use 'kyazdani42/nvim-web-devicons'
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
"lua << EOF
"local lsp_status = require('lsp-status')

"lsp_status.config({
  "kind_labels = vim.g.completion_customize_lsp_label
"})
"lsp_status.register_progress()

"local on_attach = function(client, bufnr)
  "lsp_status.on_attach(client)
"end

"require('lspconfig').rust_analyzer.setup{
  "on_attach = on_attach,
  "capabilities = lsp_status.capabilities,
"}
"EOF

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
lua <<EOF
--require'lspconfig'.sumneko_lua.setup {}
local opts = {
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
    server = {} -- rust-analyer options
}

require('rust-tools').setup(opts)
EOF
" ************  TreeSitter  ************{{{1
lua <<EOF
require'nvim-treesitter.configs'.setup {
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
        ["at"] = "@frame.outer",
        ["it"] = "@frame.inner",
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
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
      },
     i = {
          [ "C-j" ] = actions.move_selection_next,
          [ "C-k" ] = actions.move_selection_previous,
          [ "C-f" ] = actions.send_to_qflist,
          [ "q" ] = actions.smart_send_to_loclist,
     },
    },
      layout_config = {
          preview_width = 75
      }
  }
}
EOF
" ************  TODO  ************{{{1
nnoremap <silent> <A-t> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-t> <C-\><C-n>:Lspsaga close_floaterm<CR>
" TODO: better than fzf but I seriously need to change the locking
" behavior
nnoremap <leader>oa <cmd>Telescope find_files<cr>
"nnoremap <leader>ug <cmd>Telescope live_grep<cr>
nnoremap <leader>ob <cmd>Telescope buffers<cr>
nnoremap <leader>oh <cmd>Telescope oldfiles<cr>
nnoremap <leader>oc <cmd>Telescope commands<cr>
" TODO: Telescope way better here -> Harpoon will probably replace though
nnoremap <leader>ul <cmd>Telescope marks<cr>
"TODO: why is this not filtering?
nnoremap <leader>un <cmd>Telescope registers<cr>

nnoremap <leader>gb <cmd>Telescope git_branchs<CR>
nnoremap <leader>gc <cmd>Telescope git_commits<CR>

nnoremap <leader>vo <cmd>Telescope vim_options<cr>
nnoremap <leader>vc <cmd>Telescope autocommands<cr>
nnoremap <leader>vk <cmd>Telescope keymaps<cr>
nnoremap <leader>vm <cmd>Telescope help_tags<cr>

nnoremap <leader>fs <cmd>Telescope lsp_workspace_symbols<cr>

