local wezterm = require("wezterm")
local act = require("wezterm").action
local mux = require("wezterm").mux

local nvim = "/usr/bin/nvim"


local wez_nvim_action = function(window, pane, action_wez, forward_key_nvim)
    local current_process = mux.get_window(window:window_id()):active_pane():get_foreground_process_name()
    print(current_process)
    if current_process==nvim then
        window:perform_action(forward_key_nvim, pane)
    else
        window:perform_action(action_wez, pane)
    end
end

wezterm.on("move-left", function(window, pane)
	wez_nvim_action(window, pane, 
    act.ActivatePaneDirection "Left", 
    act.SendKey({key="LeftArrow", mods="ALT"}))
end)

wezterm.on("move-right", function(window, pane)
	wez_nvim_action(window, pane, 
    act.ActivatePaneDirection "Right", 
    act.SendKey({key="RightArrow", mods="ALT"}))

end)

wezterm.on("move-up", function(window, pane)
	wez_nvim_action(window, pane, 
    act.ActivatePaneDirection "Up", 
    act.SendKey({key="UpArrow", mods="ALT"}))
end)

wezterm.on("move-down", function(window, pane)
	wez_nvim_action(window, pane, 
    act.ActivatePaneDirection "Down",
    act.SendKey({key="DownArrow", mods="ALT"}))
end)

wezterm.on("close-pane", function (window, pane)
   wez_nvim_action(window, pane, 
    act.CloseCurrentPane {confirm=false},
    act.SendKey({key="x", mods="ALT"})
   )
end)
