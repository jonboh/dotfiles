local wezterm = require  wezterm 
-- https://wezfurlong.org/wezterm/config/lua/wezterm/on.html#predefined-events
local scheme = wezterm.get_builtin_color_schemes()[ tokyonight ]
scheme.background =  black  -- black out background
-- wezterm.on( gui-startup , function(window) -- generates an error notification
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   local gui_window = window:gui_window();
--   gui_window:perform_action(act.ToggleFullScreen, pane)
-- end)
act = wezterm.action


-- Open scrollback on nvim
local io = require  io 
local os = require  os 
local act = wezterm.action
local scrollback = 3500

wezterm.on( trigger-vim-with-visible-text , function(window, pane)
  -- Retrieve the current viewport s text.
  --
  -- Note: You could also pass an optional number of lines (eg: 2000) to
  -- retrieve that number of lines starting from the bottom of the viewport.
  local viewport_text = pane:get_lines_as_text(scrollback+100)

  -- Create a temporary file to pass to vim
  local name = os.tmpname()
  local f = io.open(name,  w+ )
  f:write(viewport_text)
  f:flush()
  f:close()

  -- Open a new window running vim and tell it to open the file
  window:perform_action(
    act.SpawnCommandInNewTab {
      args = {  nvim , name },
    },
    pane
  )

  -- Wait "enough" time for vim to read the file before we remove it.
  -- The window creation and process spawn are asynchronous wrt. running
  -- this script and are not awaitable, so we just pick a number.
  --
  -- Note: We don t strictly need to remove this file, but it is nice
  -- to avoid cluttering up the temporary directory.
  wezterm.sleep_ms(1000)
  os.remove(name)
end)


config = {
    color_schemes = {[ tokyonight ] = scheme},
    color_scheme = "tokyonight",
    font = wezterm.font  FiraCode Nerd Font ,
    window_decorations = "NONE",
    use_fancy_tab_bar = false,
    scrollback_lines = scrollback,
    leader = { key= Space , mods= CTRL , timeout_milliseconds=1000},
    keys = {
        {
            key= y ,
            mods=  ALT|CTRL ,
            action=act.QuickSelectArgs {
                alphabet="strdyfneai",
                action=act.CopyTo  Clipboard ,
            }
        },
        {
            key =  : ,
            mods =  LEADER|SHIFT ,
            action = act.ActivateCommandPalette,
        },
        {
            key =  / ,
            mods =  LEADER ,
            action = act.Search  CurrentSelectionOrEmptyString ,
        },

        {
            key =  C ,
            mods =  CTRL , -- <CS-c>
            action = act.CopyTo  Clipboard ,
        },
        {
            key =  V ,
            mods =  CTRL ,-- <CS-v>
            action = act.PasteFrom  Clipboard ,
        },
        -- Scrolling
        { key =  u , mods =  ALT|CTRL , action = act.ScrollByPage(-0.5) },
        { key =  d , mods =  ALT|CTRL , action = act.ScrollByPage(0.5) },
        { key =  PageUp , mods =   , action = act.ScrollByPage(-1) },
        { key =  PageDown , mods =   , action = act.ScrollByPage(1) },
        {
            key =  E ,
            mods =  ALT|CTRL ,
            action = act.EmitEvent  trigger-vim-with-visible-text ,
        },
        -- Panes
        { key =  v , mods =  ALT|CTRL , action = act.SplitHorizontal {domain=  CurrentPaneDomain } },
        { key =  h , mods =  ALT|CTRL , action = act.SplitVertical {domain=  CurrentPaneDomain } },
        { key =  x , mods =  ALT|CTRL , action = act.CloseCurrentPane {confirm=false} },
        { key =  r , mods =  ALT|CTRL , action = act.RotatePanes  Clockwise },
        { key =  R , mods =  ALT|CTRL , action = act.RotatePanes  CounterClockwise },
        { key =  s , mods =  ALT|CTRL , action = act.PaneSelect { alphabet =  strdyfneai , }, },
        { key =  m , mods =  ALT|CTRL , action = act.PaneSelect { mode =  SwapWithActive , }, },

        { key =  LeftArrow , mods = ALT|CTRL , action = act.ActivatePaneDirection  Left , },
        { key =  RightArrow , mods =  ALT|CTRL , action = act.ActivatePaneDirection  Right , },
        { key =  UpArrow , mods =  ALT|CTRL , action = act.ActivatePaneDirection  Up , },
        { key =  DownArrow , mods =  ALT|CTRL , action = act.ActivatePaneDirection  Down , },
        -- TODO: move resizing to its own mode with key_table
        { key =  LeftArrow , mods = CMD|ALT|CTRL , action = act.AdjustPaneSize { Left , 5}, },
        { key =  RightArrow , mods =  CMD|ALT|CTRL , action = act.AdjustPaneSize { Right , 5}, },
        { key =  UpArrow , mods =  CMD|ALT|CTRL , action = act.AdjustPaneSize { Up , 5}, },
        { key =  DownArrow , mods =  CMD|ALT|CTRL , action = act.AdjustPaneSize { Down ,5}, },


        -- Tabs
        { key =  t , mods =  ALT|CTRL , action = act.SpawnTab  CurrentPaneDomain  },
        { key =  1 , mods =  ALT|CTRL , action = act.ActivateTab(0) },
        { key =  2 , mods =  ALT|CTRL , action = act.ActivateTab(1) },
        { key =  3 , mods =  ALT|CTRL , action = act.ActivateTab(2) },
        { key =  4 , mods =  ALT|CTRL , action = act.ActivateTab(3) },
        { key =  5 , mods =  ALT|CTRL , action = act.ActivateTab(4) },
        { key =  6 , mods =  ALT|CTRL , action = act.ActivateTab(5) },
        { key =  7 , mods =  ALT|CTRL , action = act.ActivateTab(6) },
        { key =  8 , mods =  ALT|CTRL , action = act.ActivateTab(7) },
        { key =  9 , mods =  ALT|CTRL , action = act.ActivateTab(-1) },
        { key =  ; , mods =  ALT|CTRL , action = act.ShowDebugOverlay },
    },
    key_tables = {
        search_mode = {
            { key =  Enter , mods =  NONE , action = act.CopyMode  PriorMatch  },
            { key =  Escape , mods =  NONE , action = act.CopyMode  Close  },
            { key =  n , mods =  CTRL , action = act.CopyMode  NextMatch  },
            { key =  N , mods =  CTRL , action = act.CopyMode  PriorMatch  },
            { key =  r , mods =  CTRL , action = act.CopyMode  CycleMatchType  },
            { key =  u , mods =  CTRL , action = act.CopyMode  ClearPattern  },
            -- { key =  PageUp , mods =  NONE , action = act.CopyMode  PriorMatchPage  },
            -- { key =  PageDown , mods =  NONE , action = act.CopyMode  NextMatchPage  },
            { key =  UpArrow , mods =  NONE , action = act.CopyMode  PriorMatch  },
            { key =  DownArrow , mods =  NONE , action = act.CopyMode  NextMatch  },
        }
    }
}
-- Tab movement
-- TODO: move to its own mode
for i = 1, 8 do
  -- CMD+ALT+CTRL + number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods =  CMD|ALT|CTRL ,
    action = wezterm.action.MoveTab(i - 1),
  })
end
config.disable_default_key_bindings = true
config.warn_about_missing_glyphs = false -- TODO: fix these misiing glyphs
config.debug_key_events = false
return config
