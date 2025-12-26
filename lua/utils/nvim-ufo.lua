local M = {}

---@alias UfoVirtTextChunk {[1]: string, [2]: string} Text and highlight group

---Custom fold text handler for nvim-ufo
---@param virtText UfoVirtTextChunk[] The virtual text chunks
---@param lnum integer The start line number
---@param endLnum integer The end line number
---@param width integer The window width
---@param truncate fun(str: string, maxWidth: integer): string Truncate function
---@return UfoVirtTextChunk[] The modified virtual text chunks
M.handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0

  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end

  table.insert(newVirtText, { suffix, "MoreMsg" })

  return newVirtText
end

return M
