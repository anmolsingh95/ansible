-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.enable_tab_bar = false
config.automatically_reload_config = true
config.color_scheme = 'Tokyo Night Storm (Gogh)'
config.font = wezterm.font('JetBrainsMono Nerd Font Mono', { weight = 'Regular' })
config.font_size = 14
config.enable_scroll_bar = true
config.window_padding = {
  left = 5,
  right = 10,
  top = 12,
  bottom = 7,
}

config.hyperlink_rules = {
  -- Matches: a URL in parens: (URL)
  {
    regex = '\\((\\w+://\\S+)\\)',
    format = '$1',
    highlight = 1,
  },
  -- Matches: a URL in brackets: [URL]
  {
    regex = '\\[(\\w+://\\S+)\\]',
    format = '$1',
    highlight = 1,
  },
  -- Matches: a URL in curly braces: {URL}
  {
    regex = '\\{(\\w+://\\S+)\\}',
    format = '$1',
    highlight = 1,
  },
  -- Matches: a URL in angle brackets: <URL>
  {
    regex = '<(\\w+://\\S+)>',
    format = '$1',
    highlight = 1,
  },
  -- Then handle URLs not wrapped in brackets
  {
    regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
    format = '$0',
  },
  -- implicit mailto link
  {
    regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
    format = 'mailto:$0',
  },
}

-- and finally, return the configuration to wezterm
return config
