return {
    -- Here only for wrapping HTML tags
    -- emmet_ls is already installed in mason
        "olrtg/nvim-emmet",
        config = function()
            vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
        end,
}
