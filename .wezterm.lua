-- Import the wezterm API
local wezterm = require("wezterm")

-- Initialize an empty configuration table
local config = {}

config.color_scheme = "Kanagawa (Gogh)"
-- This is where you actually apply your config choices
config.window_padding = {
	top = 0,
	right = 0,
	left = 0,
	bottom = 0,
}

-- Remove title bar (minimize/maximize/close buttons)
config.window_decorations = "RESIZE"

-- Set the terminal font
config.font = wezterm.font("IosevkaTerm NF")

-- Hide the tab bar if only one tab is open
config.hide_tab_bar_if_only_one_tab = true

-- Background with Transparency
config.window_background_opacity = 0.85 -- Adjust this value as needed
config.macos_window_background_blur = 20 -- Adjust this value as needed
config.win32_system_backdrop = "Acrylic" -- Only Works in Windows

-- Font Size
config.font_size = 16.0

-- Smooth hack
config.max_fps = 240

-- Enable Kitty Graphics
config.enable_kitty_graphics = true

-- Disable Scroll Bar
config.enable_scroll_bar = false

-- activate ONLY if windows --
config.default_domain = "WSL:Ubuntu"
config.front_end = "OpenGL"
local gpus = wezterm.gui.enumerate_gpus()
if #gpus > 0 then
	config.webgpu_preferred_adapter = gpus[1] -- only set if there's at least one GPU
else
	-- fallback to default behavior or log a message
	wezterm.log_info("No GPUs found, using default settings")
end

-- and finally, return the configuration to wezterm
return config
