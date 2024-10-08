---@type integer
---Large file threshold size in bytes. Note: 1e6 bytes = 1 megabyte.
_G.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB


---@see vim.filetype.add.filetypes
vim.filetype.add({
	pattern = {
		['.*'] = { function(path, buf)
			return vim.bo[buf]
				and vim.bo[buf].filetype ~= "bigfile"
				and path
				and vim.fn.getfsize(path) > _G.bigfile_size
				and "bigfile"
				or nil
		end,
		},
	},
})
