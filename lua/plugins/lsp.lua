return {
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
				"asm_lsp",
				"yamlls",
			},
        	automatic_installation = true,
      	})
    end
  	},
  	{
    	'neovim/nvim-lspconfig',
    	config = function()
      		local lsp = require('lspconfig')
      		lsp.clangd.setup{}
      		lsp.pyright.setup{}
      		lsp.bashls.setup{}
      		lsp.lua_ls.setup{}
			lsp.asm_lsp.setup{}
			lsp.yamlls.setup{}
		    
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

