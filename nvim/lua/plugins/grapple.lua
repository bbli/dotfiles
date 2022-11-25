require("grapple").setup({
    scope = require("grapple.scope").root({ ".git " })
    -- Your configuration goes here
    -- Leave empty to use the default configuration
    -- Please see the Configuration section below for more information
})
vim.keymap.set('n','<leader>rr',
    function() require("grapple").untag() end
    )
vim.keymap.set('n','<leader>gg',
    function() require("grapple").popup_tags() end
    )

-- grapple log -> gl
-- open log
vim.keymap.set('n','<leader>gl',
    function() require("grapple").tag({key="log"}) end
    )
vim.keymap.set('n','<leader>ol',
    function() require("grapple").select({key="log"}) end
    )
vim.keymap.set('n','<leader>rl',
    function() require("grapple").untag({key="log"}) end
    )

-- grapple main(for inserting debug) -> gm
-- open main
vim.keymap.set('n','<leader>gm',
    function() require("grapple").tag({key="main"}) end
    )
vim.keymap.set('n','<leader>om',
    function() require("grapple").select({key="main"}) end
    )
vim.keymap.set('n','<leader>rm',
    function() require("grapple").untag({key="main"}) end
    )

-- grapple test -> gt
-- open test
vim.keymap.set('n','<leader>gt',
    function() require("grapple").tag({key="test"}) end
    )
vim.keymap.set('n','<leader>ot',
    function() require("grapple").select({key="test"}) end
    )
vim.keymap.set('n','<leader>rt',
    function() require("grapple").untag({key="test"}) end
    )

-- grapple file -> gg
-- open file

vim.keymap.set('n','<leader>gf',
    function() require("grapple").tag({key="file"}) end
    )
vim.keymap.set('n','<leader>of',
    function() require("grapple").select({key="file"}) end
    )
vim.keymap.set('n','<leader>rf',
    function() require("grapple").untag({key="file"}) end
    )
