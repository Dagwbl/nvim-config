return {
    { "glacambre/firenvim", build = ":call firenvim#install(0)" },
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "rcarriga/nvim-notify" },
        opts = {
            notification = true,
            callback = function(text)
                require("notify")(text, "info", {
                    title = "Hardtime",
                    timeout = 2000,
                })
            end,
        },
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            max_width = 80,
            max_height = 10,
            render = "default",
            stages = "fade_in_slide_out",
            top_down = true,
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
}
