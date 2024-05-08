-- huge is over 100KB
local is_huge_file = function(bufnr)
	bufnr = bufnr or 0
	local max_filesize = 100 * 1024 -- 100 KB
	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
	if ok and stats and stats.size > max_filesize then
		return true
	end
end

if is_huge_file() then
	return
end

require('config.options')
require('config.lazy')
require('config.keymaps')
require('config.autocmds')

require('lsp.config')
require('lsp.setup')
require('lsp.functions')
