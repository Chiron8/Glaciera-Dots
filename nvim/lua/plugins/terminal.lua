return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    config = function()
        require("toggleterm").setup{
            hide_numbers = true,
            auto_scroll = true,
        }
    end
}

