return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        { "s",     function() require("flash").jump() end,              desc = "Flash jump",            mode = { "n", "x", "o" } },
        { "S",     function() require("flash").treesitter() end,        desc = "Flash treesitter",      mode = { "n", "x", "o" } },
        { "r",     function() require("flash").remote() end,            desc = "Flash remote",          mode = "o" },
        { "R",     function() require("flash").treesitter_search() end, desc = "Flash treesitter search", mode = { "o", "x" } },
    },
}
