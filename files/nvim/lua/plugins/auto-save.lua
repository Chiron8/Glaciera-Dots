return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            enabled = true,
            cleaning_interval = 1250,
            debounce_delay = 5,
        })
    end,
}
