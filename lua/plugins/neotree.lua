return {
	{
    	"nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
    	dependencies = {
      		"nvim-lua/plenary.nvim",
      		"nvim-tree/nvim-web-devicons",
      		"MunifTanjim/nui.nvim",
    		{
    			'akinsho/toggleterm.nvim',
        		version = "*",
        		config = function()
            		require("toggleterm").setup()
        		end
    		},
		},
    	config = function ()
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
			
      		require("neo-tree").setup({
				close_if_last_window = true,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
				sort_case_insensitive = false,
				sort_function = nil,
				default_component_configs = {
				container = {
				enable_character_fade = true
          	},
          	indent = {
				indent_size = 2,
				padding = 1,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				with_expanders = nil,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
          	},
          	icon = {
            	folder_closed = "",
            	folder_open = "",
            	folder_empty = "󰜌",
            	default = "*",
            	highlight = "NeoTreeFileIcon"
          	},
          	modified = {
            	symbol = "[+]",
            	highlight = "NeoTreeModified",
          	},
          	name = {
            	trailing_slash = false,
            	use_git_status_colors = true,
            	highlight = "NeoTreeFileName",
          	},
          	git_status = {
        		symbols = {
					added     = "",
					modified  = "",
					deleted   = "✖",
					renamed   = "󰁕",
					untracked = "",
					ignored   = "",
					unstaged  = "󰄱",
					staged    = "",
					conflict  = "",
            	}
          	},
          	file_size = {
            	enabled = true,
            	required_width = 64,
          	},
          	type = {
            	enabled = true,
            	required_width = 122,
          	},
          	last_modified = {
            	enabled = true,
            	required_width = 88,
          	},
          	created = {
            	enabled = true,
            	required_width = 110,
          	},
          	symlink_target = {
            	enabled = false,
          	},
        },
        commands = {},
        window = {
          	position = "right",
          	width = 30,
          	mapping_options = {
            	noremap = true,
            	nowait = true,
          	},
			mappings = {
				["<space>"] = { "toggle_node", nowait = false },
				["<2-LeftMouse>"] = "open",
				["<cr>"] = "open",
				["<esc>"] = "cancel",
				["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				["a"] = { "add", config = { show_path = "none" } },
				["A"] = "add_directory",
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy",
				["m"] = "move",
				["q"] = "close_window",
				["R"] = "refresh",
          	}
        },
        nesting_rules = {},
        filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_hidden = true,
				hide_by_name = {},
				hide_by_pattern = {},
				always_show = {},
				never_show = {},
				never_show_by_pattern = {},
          	},
          	follow_current_file = {
            	enabled = true,
            	leave_dirs_open = false,
          	},
          	group_empty_dirs = false,
          	hijack_netrw_behavior = "open_default",
          	use_libuv_file_watcher = false,
          	window = {
            	mappings = {
              		["<bs>"] = "navigate_up",
              		["."] = "set_root",
              		["<c-h>"] = "toggle_hidden",
            	}
         	},
        	commands = {}
		},
        buffers = {
          	follow_current_file = {
            	enabled = true,
            	leave_dirs_open = false,
          	},
          	group_empty_dirs = true,
        	show_unloaded = true,
        },
        git_status = {
          	window = {
            	position = "float",
					mappings = {
						["A"]  = "git_add_all",
						["gu"] = "git_unstage_file",
						["ga"] = "git_add_file",
						["gr"] = "git_revert_file",
						["gc"] = "git_commit",
						["gp"] = "git_push",
						["gg"] = "git_commit_and_push",
						["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" }},
						["oc"] = { "order_by_created", nowait = false },
						["od"] = { "order_by_diagnostics", nowait = false },
              			["om"] = { "order_by_modified", nowait = false },
              			["on"] = { "order_by_name", nowait = false },
              			["os"] = { "order_by_size", nowait = false },
              			["ot"] = { "order_by_type", nowait = false },
            		}
          		}
        	}
      	})

      		vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    	end
  	},
}
