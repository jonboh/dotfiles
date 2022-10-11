local wezterm = require  wezterm 

local scheme = wezterm.get_builtin_color_schemes()[ tokyonight ]
scheme.background =  black  -- black out background

return {
    color_schemes = {[ tokyonight ] = scheme},
    color_scheme = "tokyonight",
    font = wezterm.font  FiraCode Nerd Font ,
    window_background_opacity = 0.9,
}
