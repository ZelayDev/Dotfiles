hl.config
(
	{
		input =
		{
			kb_layout  = "us, ru",
			kb_variant = "",
			kb_model   = "",
			kb_options = "",
			kb_rules   = "",

			follow_mouse = 1,

			sensitivity = 0.2,
			touchpad =
			{
				tap_to_click = true,
				drag_lock = true,
				natural_scroll = true,
			},
		},
	}
)

hl.gesture
(
	{
		fingers = 3,
		direction = "horizontal",
		action = "workspace"
	}
)

-- Example per-device config
-- See https://wiki.hypr.land/configuring/core/devices/ for more
hl.device
(
	{
	    name = "epic-mouse-v1",
	    sensitivity = -0.5,
	}
)
