local options = {
	backup = false,
	cmdheight = 1,
	completeopt = { "menu", "menuone", "noselect" },
	sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",
	conceallevel = 0,
	cursorline = true,
	expandtab = true,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	infercase = true,
	number = true,
	numberwidth = 2,
	pumheight = 5,
	relativenumber = true,
	scrolloff = 6,
	shiftwidth = 2,
	showmode = false,
	showtabline = 1,
	sidescrolloff = 6,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	autoindent = true,
	swapfile = false,
	tabstop = 4,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	updatetime = 50,
	wrap = true,
	writebackup = false,
	splitbelow = true,
	splitright = true,
	incsearch = true,
	linebreak = true,
	foldmarker = "{,}",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

-- Folding with tresitter
vim.cmd([[ set foldmethod=expr ]])
vim.cmd([[ set foldexpr=nvim_treesitter#foldexpr() ]])

vim.cmd([[ set backspace=eol,start,indent]])

-- Remove useless messages in statusline
vim.cmd([[ set shortmess+=c ]])

-- Buffer behavior
vim.cmd([[ set switchbuf=useopen,uselast,usetab ]])

-- Mouse for the normies
vim.cmd([[set mouse=a]])

-- Autocommands
-- Return to the previous location in the file on open
vim.api.nvim_create_autocmd(
	"BufReadPost",
	{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] }
)

-- Autoread buffer on an external change
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { command = "checktime" })

-- Easily close useless buffers
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sqls_output", "help", "startuptime", "qf", "lspinfo", "httpRequest" },
	command = [[ nnoremap <buffer><silent> q :close<CR> ]],
})

vim.api.nvim_create_autocmd("FileType", { pattern = { "man" }, command = [[ nnoremap <buffer><silent> q :quit<CR> ]] })

-- Fix that god damn formatoptions (for some reason have to do it on every BufEnter)
-- Prevent annoying comment continuation when inserting a new line with 'O'
vim.api.nvim_create_autocmd("BufEnter", {
	command = "set formatoptions-=cro",
})

local function tab_win_closed(winnr)
	local api = require("nvim-tree.api")
	local tabnr = vim.api.nvim_win_get_tabpage(winnr)
	local bufnr = vim.api.nvim_win_get_buf(winnr)
	local buf_info = vim.fn.getbufinfo(bufnr)[1]
	local tab_wins = vim.tbl_filter(function(w)
		return w ~= winnr
	end, vim.api.nvim_tabpage_list_wins(tabnr))
	local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
	if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
		-- Close all nvim tree on :q
		if not vim.tbl_isempty(tab_bufs) then -- and was not the last window (not closed automatically by code below)
			api.tree.close()
		end
	else -- else closed buffer was normal buffer
		if #tab_bufs == 1 then -- if there is only 1 buffer left in the tab
			local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
			if last_buf_info.name:match(".*NvimTree_%d*$") then -- and that buffer is nvim tree
				vim.schedule(function()
					if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
						vim.cmd("quit") -- then close all of vim
					else -- else there are more tabs open
						vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
					end
				end)
			end
		end
	end
end

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function()
		local winnr = tonumber(vim.fn.expand("<amatch>"))
		---@diagnostic disable-next-line: param-type-mismatch
		vim.schedule_wrap(tab_win_closed(winnr))
	end,
	nested = true,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "NvimTree*",
	callback = function()
		local api = require("nvim-tree.api")
		local view = require("nvim-tree.view")

		if not view.is_visible() then
			api.tree.open()
		end
	end,
})
