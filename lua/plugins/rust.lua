return {
    {
        'mrcjkb/rustaceanvim',
        version = '^4',
        lazy = false,
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup({
                lsp = {
                    enabled = true,
                    on_attach = function(client, bufnr)
                    end,
                    actions = true,
                    completion = true,
                    hover = true,
                },
                completion = {
                    crates = {
                        enabled = true,
                        max_results = 25,
                        min_chars = 1
                    },
                },
                text = {
                    loading = "  Loading...",
                    version = "  %s",
                    prerelease = "  %s",
                    yanked = "  %s yanked",
                    nomatch = "  Not found",
                    upgrade = "  %s",
                    error = "  Error fetching crate",
                },
            })
        end
    }
}

