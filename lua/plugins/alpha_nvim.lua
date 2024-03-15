return{
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
     "                                                                               ",
     "              ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗               ",
     "              ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║               ",
     "              ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║               ",
     "              ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║               ",
     "              ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║               ",
     "              ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝               ",
     "                                                                               ",
     "                                                                               ",
     "                                                                               ",
    [[                                    ██████                                    ]],
    [[                                ████▒▒▒▒▒▒████                                ]],
    [[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
    [[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
    [[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
    [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
    [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
    [[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
    [[                        ██      ██      ████      ████                        ]],        }
        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("s",  "  > Restore session", ":SessionRestore <CR>"),
            dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
            dashboard.button( "p", "  > Open Projects"   , ":Telescope projects<CR>"),
            dashboard.button( "r", "  > Open Recent Files"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "t", "  > Open File Tree", ":Neotree<CR>"),
            dashboard.button( "u", "󰂖  > Update Plugins", ":Lazy update<CR>"),
            dashboard.button("c",  "  > Open Configurations", ":e $MYVIMRC | :cd %:p:h | pwd<CR>"),
            dashboard.button( "q", "󰗼  > Quit NVIM", ":qa<CR>"),
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
        vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local count = (math.floor(stats.startuptime * 100) / 100)
                                local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
                                local version = vim.version()
                                local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

				dashboard.section.footer.val = {
					"󱐌 " .. stats.count .. " plugins loaded in " .. count .. " ms",
                                         datetime .. nvim_version_info

                                        
				}
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
    end
}
