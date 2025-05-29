-- Lazy
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("onedarkpro").setup ({
      vim.cmd("colorscheme onedark")
    })

end
}

