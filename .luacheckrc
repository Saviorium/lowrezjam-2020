ignore = {
   "212",  -- unused argument 'self'
   "213",  -- Unused loop variable
}

std = 'lua51+love'
max_line_length = 160

globals = {
  -- love and libs
  "love",
  "Class",
  "Vector",
  "serpent", -- todo: include by demand only

  -- engine
  "vardump",
  "Debug",
  "config",
  -- utils
  "hslToRgb",
  "addColorsInPlace",
  math = {
    fields = {
      "clamp"
    }
  },

  -- game
  "StateManager",
  "states",
  "Images",
  "Fonts",
  "HC",
  "LEVELS",
}
