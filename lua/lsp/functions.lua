local M = {}

function M.enable_format_on_save()
  local group = vim.api.nvim_create_augroup("format_on_save", { clear = false })
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      local root_dir = vim.fn.getcwd()
      local eslint_config_mjs = root_dir .. "/eslint.config.mjs"
      local eslintrc = root_dir .. "/.eslintrc"
      local eslintrc_js = root_dir .. "/.eslintrc.js"
      local eslintrc_json = root_dir .. "/.eslintrc.json"

      -- Check if eslint LSP is active
      local active_clients = vim.lsp.buf_get_clients()
      local eslint_is_active = false

      for _, client in ipairs(active_clients) do
        if client.name == "eslint" then
          eslint_is_active = true
          break
        end
      end

      local found_eslint_config = vim.fn.filereadable(eslintrc) == 1 or vim.fn.filereadable(eslintrc_json) == 1 or vim.fn.filereadable(eslintrc_js) == 1 or vim.fn.filereadable(eslint_config_mjs) == 1

      if eslint_is_active and found_eslint_config then
        vim.cmd("EslintFixAll")
      else
        vim.lsp.buf.format()
      end
    end,
    group = group,
  })
end

function M.disable_format_on_save()
  vim.api.nvim_del_augroup_by_name("format_on_save")
end

function M.toggle_format_on_save()
  if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

vim.api.nvim_create_user_command("LspToggleAutoFormat", 'lua require("lsp.functions").toggle_format_on_save()', {})

return M
