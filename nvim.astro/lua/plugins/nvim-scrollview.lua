return {
    "dstein64/nvim-scrollview",
    event = "BufReadPost",
    config = function()
        require("scrollview").setup({
            -- Add any custom configuration options here
        })
    end,
}
