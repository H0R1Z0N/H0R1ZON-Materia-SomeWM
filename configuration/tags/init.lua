local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')
local apps = require('configuration.apps')

local tags = {
  {
    icon = icons.Num1,
    type = 'any',
    defaultApp = apps.default.rofi
  },
  {
    icon = icons.Num2,
    type = 'any',
    defaultApp = apps.default.rofi
  },
  {
    icon = icons.Num3,
    type = 'any',
    defaultApp = apps.default.rofi,
  },
  {
    icon = icons.Num4,
    type = 'any',
    defaultApp = apps.default.rofi
  },
  {
    icon = icons.Num5,
    type = 'any',
    defaultApp = apps.default.rofi
  },
  {
    icon = icons.Num6,
    type = 'any',
    defaultApp = apps.default.rofi
  },
  {
    icon = icons.Num7,
    type = 'any',
    defaultApp = apps.default.rofi
  },
  {
    icon = icons.Num8,
    type = 'any',
    defaultApp = apps.default.rofi
  },
  {
    icon = icons.Num9,
    type = 'any',
    defaultApp = apps.default.rofi
  }
}

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.max,
  awful.layout.suit.floating
}

awful.screen.connect_for_each_screen(
  function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(
        i,
        {
          icon = tag.icon,
          icon_only = true,
          layout = awful.layout.suit.max,
          gap_single_client = false,
          gap = 4,
          screen = s,
          defaultApp = tag.defaultApp,
          selected = i == 1
        }
      )
    end
  end
)

_G.tag.connect_signal(
  'property::layout',
  function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = 4
    end
  end
)
