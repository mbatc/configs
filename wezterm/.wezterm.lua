local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { "powershell.exe" }

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds=1000 }

config.automatically_reload_config = true

config.keys = {
  -- Split pane horizontally with Leader + -
  { mods = 'LEADER', key = '-', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  -- Split pane vertically with Leader + %
  { mods = 'LEADER', key = '\\', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  -- Zoom pane with Leader + m
  { mods = 'LEADER', key = 'm', action = wezterm.action.TogglePaneZoomState },
  { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = false }, },
  { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab { confirm = true }, },
  { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
  { key = 'n', mods = 'CTRL|SHIFT', action = wezterm.action.PromptInputLine {
    description = wezterm.format {
      { Text = "Enter name for new workspace" }
    },
    action = wezterm.action_callback(
      function(window, pane, line)
        if line then
          window:perform_action(
            wezterm.action.SwitchToWorkspace {
              name = line
            },
            pane
          )
	      end
      end)
    }
  }
}


return config

