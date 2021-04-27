require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
--require'nvim-treesitter.configs'.setup {
  --ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --highlight = {
    --enable = true,              -- false will disable the whole extension
  --},
--}

--require'nvim-treesitter.configs'.setup {
  --highlight = {
    --enable = true,
    --use_languagetree = false, -- Use this to enable language injection (this is very unstable)
  --},
--}

--require'nvim-treesitter.configs'.setup {
  --incremental_selection = {
    --enable = true,
    --keymaps = {
      --init_selection = "gnn",
      --node_incremental = "grn",
      --scope_incremental = "grc",
      --node_decremental = "grm",
    --},
  --},
--}
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        --["<c-n>"] = false,
        --["<c-p>"] = false,

        -- Otherwise, just set the mapping to the function that you want it to be.
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        -- You can perform as many actions in a row as you like
        ["<CR>"] = actions.select_default + actions.center,
      },
      n = {
        ["<esc>"] = actions.close,
        --["<C-i>"] = my_cool_custom_action,
      },
    },
  }
}
