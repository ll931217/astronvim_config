require("noice").setup {
    cmdline = {
        format = { title = false },
    },
    lsp = {
        signature = {
            enabled = false,
        },
        hover = {
            enabled = false,
        },
        progress = {
            enabled = false,
        }
    },
}
