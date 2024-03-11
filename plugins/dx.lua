return {
    {
        'Lilja/zellij.nvim',
        lazy = true,
        event = 'VeryLazy',
        config = function()
            require('zellij').setup {
                vimTmuxNavigatorKeybinds = true,
            }
        end
    }
}
