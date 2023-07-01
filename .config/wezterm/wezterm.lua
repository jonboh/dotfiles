local wezterm = require  wezterm 

local scheme = wezterm.get_builtin_color_schemes()[ tokyonight ]
scheme.background =  black  -- black out background

-- wezterm.on( gui-startup , function(window) -- generates an error notification
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   local gui_window = window:gui_window();
--   gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
-- end)

return {
    color_schemes = {[ tokyonight ] = scheme},
    color_scheme = "tokyonight",
    font = wezterm.font  FiraCode Nerd Font ,
    window_decorations = "NONE",
    window_background_opacity = 1,
    enable_tab_bar = false,
}
