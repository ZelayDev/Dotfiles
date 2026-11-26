-- See https://wiki.hypr.land/configuring/core/advanced-configuration/permissions/
hl.config
(
	{
		ecosystem =
		{
			enforce_permissions = false,
		},
	}
)

hl.permission("/usr/bin/grim", "screencopy", "allow")
hl.permission("/usr/lib/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/bin/hyprpm", "plugin", "allow")
