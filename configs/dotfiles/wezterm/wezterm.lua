-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- default shell
config.default_prog = {'/run/current-system/sw/bin/fish' }
config.enable_wayland = false
-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.font = wezterm.font('JuliaMono' ,{stretch='Normal'})
config.font_size = 14
-- Use cursive and ligatures
config.harfbuzz_features = { 'zero' }

-- and finally, return the configuration to wezterm
return config
