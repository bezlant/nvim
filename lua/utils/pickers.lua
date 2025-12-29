---@class utils.Pickers
local M = {}

--- Pick from installed lazy.nvim plugins
--- Opens plugin directory with Oil on confirm, README with <C-r>
function M.lazy_plugins()
  local plugins = require("lazy").plugins()
  local items = {}

  for _, plugin in ipairs(plugins) do
    if plugin.dir then
      table.insert(items, {
        text = plugin.name,
        file = plugin.dir,
        name = plugin.name,
        url = plugin.url or "",
      })
    end
  end

  table.sort(items, function(a, b)
    return a.name < b.name
  end)

  Snacks.picker.pick({
    title = "Lazy Plugins",
    items = items,
    format = function(item)
      return {
        { " 󰏓 ", "Special" },
        { item.name, "Title" },
        { "  " .. item.file, "Comment" },
      }
    end,
    confirm = function(picker, item)
      picker:close()
      if item then
        require("oil").open(item.file)
      end
    end,
    actions = {
      readme = function(picker, item)
        picker:close()
        if item then
          local readme = item.file .. "/README.md"
          if vim.fn.filereadable(readme) == 1 then
            vim.cmd.edit(readme)
          else
            vim.notify("No README.md found", vim.log.levels.WARN)
          end
        end
      end,
    },
    win = {
      input = {
        keys = {
          ["<C-r>"] = { "readme", mode = { "i", "n" }, desc = "Open README" },
        },
      },
    },
  })
end

return M
