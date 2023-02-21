local colorscheme = "darkminus" or "darkplus"

local status_ok, cs = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
