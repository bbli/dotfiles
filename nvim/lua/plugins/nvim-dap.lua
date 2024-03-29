--require('telescope').load_extension('dap') -- NOTE: needs to be called after telescope setup
-- local dap = require('dap')
-- dap.adapters.lldb = {
--   type = 'executable',
--   command = '/usr/bin/lldb-vscode', -- adjust as needed
--   name = "lldb"
-- }
-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "lldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},

--     runInTerminal = false,
--   },
-- }
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp
-- dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

-- vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
-- EOF
-- au FileType dap-repl lua require('dap.ext.autocompl').attach()
-- nnoremap <silent> <localleader>dc :lua require'dap'.continue()<CR>
-- nnoremap <silent> <localleader>ds :lua require'dap'.step_over()<CR>
-- nnoremap <silent> <localleader>di :lua require'dap'.step_into()<CR>
-- nnoremap <silent> <localleader>do :lua require'dap'.step_out()<CR>
-- nnoremap <silent> <localleader>db :lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <localleader>dB :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <localleader>dp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <localleader>dr :lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <localleader>dl :lua require'dap'.run_last()<CR>
-- nnoremap <silent> <localleader>dq :lua require'dap'.stop()<CR>

-- Telescope dap commands
-- Telescope dap configurations
-- Telescope dap list_breakpoints
-- Telescope dap variables
-- Telescope dap frames
 -- typical debug flow consists of:
-- .Setting breakpoints via :lua require'dap'.toggle_breakpoint().
-- . Launching debug sessions and resuming execution via :lua require'dap'.continue().
-- . Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
-- . Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)

-- let g:dap_virtual_text = 'all_frames'
