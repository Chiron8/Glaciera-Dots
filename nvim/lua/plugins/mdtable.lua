return {
  'Kicamon/markdown-table-mode.nvim',
  config = function()
    require('markdown-table-mode').setup({
        filetype = {
            "*.md",
        },
        options = {
            insert = true,
            insert_leave = true,
            pad_separator_line = true,
            alig_style = "center",
        },
    })
  end
}
