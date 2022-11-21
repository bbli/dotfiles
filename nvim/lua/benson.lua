M = {}
local api = vim.api
local lsp = vim.lsp
function length(array)
    local cnt = 0
    for x,y in ipairs(array) do
        cnt = cnt + 1 
    end
    return cnt
end

function get_window_count_of_current_tab()
    return length(api.nvim_tabpage_list_wins(api.nvim_get_current_tabpage()))
end

function M.smartJumpSplit()
    if (get_window_count_of_current_tab() > 1) then
        print "make a horizontal split"
        api.nvim_command("split")
        vim.cmd [[wincmd p]]
        lsp.buf.definition()
    else
        print "make a vertical split"
        api.nvim_command("vs")
        lsp.buf.definition()
    end
end
return M
