return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "html", "go", "markdown", "markdown_inline" },
                sync_install = true,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end

    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "nvimtools/none-ls.nvim"
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = { "pyright", "bashls" }
            })
        end
    },
  	{
    	'williamboman/mason.nvim',
    	config = function()
      		require("mason").setup({
				ui = {
        			icons = {
            			package_installed = "✓",
            			package_pending = "➜",
            			package_uninstalled = "✗"
        			}
    			},
			})
    	end
  	},
  	{
    	'williamboman/mason-lspconfig.nvim',
    	config = function()
      	require("mason-lspconfig").setup({
        	ensure_installed = { 
				"pyright", 
				"bashls", 
				"yamlls",
                "gopls",
			    "clangd",
            },
        	automatic_installation = true,
      	})
    end
  	},
  	{
    	'neovim/nvim-lspconfig',
    	config = function()
      		local lsp = require('lspconfig')
      		lsp.pyright.setup{}
      		lsp.bashls.setup{}
			lsp.yamlls.setup{}
            lsp.gopls.setup{}
            lsp.clangd.setup{}
            require("clangd_extensions.inlay_hints").setup_autocmd()
            require("clangd_extensions.inlay_hints").set_inlay_hints() 
            
       end
  	},
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },
}

