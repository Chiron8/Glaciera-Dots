local M = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  dependencies = {
    "OXY2DEV/markview.nvim",
  },
  config = function()
    local ts = require("nvim-treesitter")

    -- 1. Safely initialize setup if it exists on the current branch
    if ts.setup then
      ts.setup()
    end

    local parsers = {
      "c", "lua", "python", "bash", "javascript", "typescript",
      "html", "css", "json", "markdown", "markdown_inline",
    }

    -- 2. Guard clause: Only call install if lazy has fetched the new branch
    if ts.install then
      ts.install(parsers)
    else
      vim.schedule(function()
        vim.notify("Treesitter is still on the old branch! Run :Lazy sync to update.", vim.log.levels.WARN)
      end)
    end

    -- 3. Highlighting autocmd
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}

return { M }
