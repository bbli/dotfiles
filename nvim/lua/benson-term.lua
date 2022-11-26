M = {}
-- TODO
Last_Term_String = ""
function M.send_string_to_term(term_string)
    -- 1. First let us just try to get command with spaces into Lua
        -- SC: vimscript does this with cword?
        -- SC: check how other plugins do this!!!(harpoon)
            -- Telescope: does this by calling vimscript "getcmdline"
    --
    -- 2. Now just save it as last invocation
    Last_Term_String = term_string

    -- 3. And finally forward it to FloatTermSend 
        -- SC: grep pack directory to see if anyone else uses "nvim_cmd"!!!
    vim.api.nvim_cmd({cmd="FloatermSend",args={term_string}},{})
end
-- SC: How does Telescope command_history remember current session + old commands?

function M.send_last_string_to_term()
    vim.api.nvim_cmd({cmd="FloatermSend",args={Last_Term_String}},{})
end
-- vim.keymap.set('n','<leader>ss',
--     function() SaveCommandToList() end
--     )
return M
