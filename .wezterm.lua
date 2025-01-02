-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Banana Blueberry'

config.keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  -- Clears only the scrollback and leaves the viewport intact.
  -- You won't see a difference in what is on screen, you just won't
  -- be able to scroll back until you've output more stuff on screen.
  -- This is the default behavior.
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ClearScrollback 'ScrollbackOnly',
  },
  -- Clears the scrollback and viewport leaving the prompt line the new first line.
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },
  -- Clears the scrollback and viewport, and then sends CTRL-L to ask the
  -- shell to redraw its prompt
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.Multiple {
      wezterm.action.ClearScrollback 'ScrollbackAndViewport',
      wezterm.action.SendKey { key = 'L', mods = 'CTRL' },
    },
  }, 
  {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },
}

-- and finally, return the configuration to wezterm
return config
