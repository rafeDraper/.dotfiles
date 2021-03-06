local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	return
end

dashboard.custom_header = {
	"",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣶⣦⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⣴⣴⣦⡀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⠀⠀⠀⠀⠀⠀⠀⠀⢠⣤⣦⡀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⢠⣽⣿⣿⣷⣦⣄⡀⠀⢸⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢠⠀⠀⠀⠀⠀⠀⡠⢟⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⠉⠻⢿⣿⣿⣦⣼⣿⣸⣿⠿⠛⠻⡿⠻⢿⠿⠾⠿⢿⡄⠐⠀⢀⣀⣤⣶⣿⣿⠟⠿⣿⠿⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⠈⠙⠻⣿⡍⣿⡇⠀⠀⡠⣧⣇⢸⠀⠀⡀⢀⣷⠀⣺⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣡⣿⣷⣶⡾⢿⡟⠀⠂⡹⢶⣴⣾⡿⠀⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣻⡿⢧⣴⣿⣧⣴⣤⡟⢸⢿⡛⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⣾⣧⠓⣽⣿⣿⣿⢿⡿⡆⡞⡁⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣤⡴⣺⣿⣿⣾⠿⠟⢻⣤⣯⣝⡟⣛⣛⣯⡥⢠⡇⠿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠿⢿⣿⣿⣿⠿⠟⠛⠉⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣵⠟⠀⠀⠀⠉⠛⠛⢿⣿⣧⣤⣴⣾⣽⣷⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⢺⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⣿⣿⣿⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⣾⠛⠛⠀⠚⢿⣿⠛⠀⠀⠀⠀⣿⠛⢷⡆⠀⣼⣿⣷⡀⠀⣾⡇⠀⢰⣿⠀⢸⣿⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣷⡄⠀⢸⣿⠀⠀⠀⠀⠀⣿⠶⠿⠃⢰⣿⣁⣻⣧⠀⢿⡇⠀⢸⣿⠀⢸⣿⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠐⠷⠶⠟⠁⠀⠸⠿⠀⠰⠆⠀⠀⠿⠀⠀⠀⠿⠏⠉⠉⠿⠆⠘⠿⠶⠾⠋⠀⠸⠿⠷⠶⠀⠿⠇⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"",
}
dashboard.custom_center = {
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "DashboardFindHistory",
		shortcut = "SPC f h    ",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f    ",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		action = "Telescope file_browser",
		shortcut = "SPC f b    ",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f w    ",
	},
	{
		icon = "  ",
		desc = "Browse dotfiles                         ",
		action = "Telescope find_files cwd=~/.config/nvim/ search_dirs=Ultisnips,lua,viml,init.vim",
		shortcut = "SPC v d    ",
	},
	{
		icon = "  ",
		desc = "Update                                  ",
		action = "PackerSync",
		shortcut = ":PackerSync",
	},
	{
		icon = "  ",
		desc = "Close neovim                            ",
		action = "qa!",
		shortcut = ":qa!       ",
	},
}
