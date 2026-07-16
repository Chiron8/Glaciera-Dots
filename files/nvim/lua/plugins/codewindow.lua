return {
  -- Switch from gorbit99/codewindow.nvim to the fixed fork
  "taylrfnt/codewindow.nvim",
  config = function()
    local codewindow = require("codewindow")
    codewindow.setup({
      active_in_minimap = false, -- Prevent minimap from showing inside itself
      auto_enable = false,       -- Set to true if you want it open on every file
      exclude_filetypes = { "help", "NvimTree", "lazy", "mason" },
    })
    
    -- Optional: Add a quick keymap to toggle the minimap
    vim.keymap.set("n", "<leader>mm", codewindow.toggle_minimap, { desc = "Toggle Minimap" })
  end,
}
