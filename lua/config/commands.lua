-- Add a confirmation to quitting (Change :q to :confirm q)
vim.cmd [[ cnoreabbrev <expr> q ((getcmdtype() is# ':' && getcmdline() is# 'q')?('confirm q'):('q')) ]]
vim.cmd [[ cnoreabbrev <expr> qa ((getcmdtype() is# ':' && getcmdline() is# 'qa')?('confirm qa'):('qa')) ]]

