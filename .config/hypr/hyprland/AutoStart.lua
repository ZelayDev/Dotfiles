-- See https://wiki.hypr.land/configuring/core/autostart/
hl.on
(
	"hyprland.start",
	function() 
		hl.exec_cmd("nm-applet")
		hl.exec_cmd("waybar")
		hl.exec_cmd("hyprpaper")

		hl.exec_cmd("awww-daemon")
        hl.exec_cmd("sh -c '[ -f ~/.config/hypr/last_wallpaper ] && awww img $(cat ~/.config/hypr/last_wallpaper)'")

		hl.exec_cmd("wl-paste --type text --watch cliphist store -max-items 50")
	end
)
