ignore = {
   "212",  -- unused argument 'self'
}

std = 'lua51+love'

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

  -- game
  "StateManager",
  "states",
}
