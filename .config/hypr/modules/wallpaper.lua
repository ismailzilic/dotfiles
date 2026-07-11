local wallpaper_dir = os.getenv("HOME") .. "/Pictures/Wallpapers"

os.execute("mkdir -p " .. wallpaper_dir)

local function get_random_wallpaper()
    	local handle = io.popen(
        	'find "' .. wallpaper_dir .. '" -type f \\( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" \\) 2>/dev/null | shuf -n 1'
    	)
    	local result = handle:read("*l")
    	handle:close()
    	return result
end

function _G.set_wallpaper()
    	local wallpaper = get_random_wallpaper()
    	if wallpaper == nil or wallpaper == "" then
        	return
    	end

    	hl.exec_cmd(
        	'swww img "' .. wallpaper .. '" ' ..
        	'--transition-type random ' ..
        	'--transition-duration 1.5 ' ..
        	'--transition-fps 60'
    	)
end

hl.timer(set_wallpaper, { timeout = 1000, type = "oneshot" })
hl.timer(set_wallpaper, { timeout = 3600000, type = "repeat" })
