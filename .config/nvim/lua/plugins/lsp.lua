return {
    { "mason-org/mason.nvim", opts = {} },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = { "pyright", "lua_ls" },
            automatic_enable = false,
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
            vim.lsp.enable({ "pyright", "lua_ls" })
        end,
    },
}
