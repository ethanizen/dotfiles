-- modified version of code from this config
-- https://github.com/xaaha/dev-env/blob/main/nvim/.config/nvim/lua/xaaha/plugins/lsp-nvim-treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    event = "BufRead",
    branch = "main",
    build = ":TSUpdate",
    ---@class TSConfig
    opts = {
      -- custom handling of parsers
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "vimdoc",
        "yaml",
        "hyprlang",

      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
}
