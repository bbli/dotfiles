local g = vim.g
require'lightspeed'.setup {
    ignore_case = true,
    }
vim.keymap.set('n','l','<Plug>Lightspeed_s')
vim.keymap.set('n','h','<Plug>Lightspeed_S')
g.lightspeed_no_default_keymaps = 1

