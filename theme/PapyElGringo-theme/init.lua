local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Overlock Regular 12'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.red
theme.primary.hue_500 = '#990033'
-- Accent
theme.accent = mat_colors.pink

-- Background
theme.background = mat_colors.green

theme.background.hue_800 = '#770000'
theme.background.hue_900 = '#ff0088'

local awesome_overrides = function(theme)
  --
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
