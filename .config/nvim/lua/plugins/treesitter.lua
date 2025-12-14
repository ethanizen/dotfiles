return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        require'nvim-treesitter'.install {
            'vimdoc',
            'python',
            'c',
            'lua',
            'vim',
            'markdown',
            'markdown_inline',
            'query',
        } end
}
