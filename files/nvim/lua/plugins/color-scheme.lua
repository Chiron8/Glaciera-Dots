return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Make sure it loads before other plugins
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        integration_default = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope = true,
          },
          -- For your markview plugin
          markdown = true,
        },
      })

      -- Set the colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
