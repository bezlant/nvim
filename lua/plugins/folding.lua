-- Native treesitter folding (local plugin)
-- Treesitter node types that represent imports per language
local import_node_types = {
  javascript = { "import_statement" },
  javascriptreact = { "import_statement" },
  typescript = { "import_statement" },
  typescriptreact = { "import_statement" },
  python = { "import_statement", "import_from_statement" },
  go = { "import_declaration" },
  lua = { "function_call" }, -- require() calls
}

---Check if a treesitter node is an import
---@param node TSNode
---@param lang string
---@return boolean
local function is_import_node(node, lang)
  local node_type = node:type()
  local types = import_node_types[lang]
  if not types then
    return false
  end
  if lang == "lua" and node_type == "function_call" then
    local text = vim.treesitter.get_node_text(node, 0)
    return text:match("^require") ~= nil
  end
  return vim.tbl_contains(types, node_type)
end

---Find import lines using treesitter
---@param bufnr integer
---@return integer[]
local function find_import_lines(bufnr)
  local ft = vim.bo[bufnr].filetype
  local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
  if not ok or not parser then
    return {}
  end
  local tree = parser:parse()[1]
  if not tree then
    return {}
  end
  local root = tree:root()
  local import_lines = {}
  for node in root:iter_children() do
    if is_import_node(node, ft) then
      table.insert(import_lines, node:start() + 1)
    end
  end
  return import_lines
end

---Close import folds in current buffer
local function close_imports()
  local import_lines = find_import_lines(vim.api.nvim_get_current_buf())
  for _, lnum in ipairs(import_lines) do
    pcall(function() vim.cmd(lnum .. "foldclose") end)
  end
end

---@type LazySpec
return {
  "folding",
  virtual = true,
  lazy = false,
  init = function()
    -- Safe foldexpr wrapper (prevents errors when parser not ready)
    _G.foldexpr = function()
      local ok, result = pcall(vim.treesitter.foldexpr)
      return ok and result or "0"
    end

    -- Foldtext function
    _G.foldtext = function()
      local line = vim.fn.getline(vim.v.foldstart)
      local count = vim.v.foldend - vim.v.foldstart
      return {
        { line, "Normal" },
        { " 󰁂 " .. count .. " ", "MoreMsg" },
      }
    end

    -- Set fold options
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "v:lua.foldexpr()"
    vim.o.foldtext = "v:lua.foldtext()"
  end,
  config = function()
    -- Auto-fold imports
    vim.api.nvim_create_autocmd("FileType", {
      pattern = vim.tbl_keys(import_node_types),
      callback = function()
        vim.defer_fn(function()
          local bufnr = vim.api.nvim_get_current_buf()
          if vim.api.nvim_buf_is_valid(bufnr) then
            local cursor = vim.api.nvim_win_get_cursor(0)
            close_imports()
            pcall(vim.api.nvim_win_set_cursor, 0, cursor)
          end
        end, 100)
      end,
    })

    -- Keymaps: unfold but keep imports closed
    vim.keymap.set("n", "zr", function()
      vim.cmd("normal! zr")
      close_imports()
    end, { desc = "Unfold one level (keep imports)" })

    vim.keymap.set("n", "zR", function()
      vim.cmd("normal! zR")
      close_imports()
    end, { desc = "Open all folds (keep imports)" })
  end,
}
