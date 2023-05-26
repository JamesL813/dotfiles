local theme = "dark"
local openPop = assert(io.popen("gsettings get org.gnome.Console theme", "r"))
local console = openPop:read("*all")
openPop:close()

if string.match(console, "night") then
	theme = "dark"
elseif string.match(console, "day") then
	theme = "light"
elseif string.match(console, "auto") then
	local openPop = assert(io.popen("gsettings get org.gnome.desktop.interface color-scheme", "r"))
	local gnome = openPop:read("*all")
	openPop:close()
	if string.match(gnome, "prefer-dark") then
		theme = "dark"
	elseif string.match(gnome, "prefer-light") or string.match(gnome, "default") then
		theme = "light"
	end
end

local colorscheme = "darkminus"

if theme == "light" then
	colorscheme = "lightminus"
end

local status_ok, cs = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
