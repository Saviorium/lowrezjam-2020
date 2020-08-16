return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 64,
  height = 16,
  tilewidth = 4,
  tileheight = 4,
  nextlayerid = 15,
  nextobjectid = 43,
  properties = {},
  tilesets = {
    {
      name = "city_tileset",
      firstgid = 1,
      filename = "../graphics/city_tileset.tsx",
      tilewidth = 4,
      tileheight = 4,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "../graphics/city_tileset.png",
      imagewidth = 64,
      imageheight = 88,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 4,
        height = 4
      },
      properties = {},
      terrains = {},
      tilecount = 352,
      tiles = {}
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../images/64grid.png",
      id = 14,
      name = "grid",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {}
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 64,
      height = 16,
      id = 13,
      name = "background",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 261, 262, 247, 248, 247, 261, 262, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 277, 278, 247, 248, 247, 277, 278, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248, 247, 248,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "group",
      id = 5,
      name = "a",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      layers = {
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 64,
          height = 16,
          id = 2,
          name = "background",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          properties = {},
          encoding = "lua",
          data = {
            2147483713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 2147483713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 2147483713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483736, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 97,
            2147483713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 2147483713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 2147483713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483736, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 113,
            2147483713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 2147483713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 2147483713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483768, 2147483767, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 65,
            2147483729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 2147483729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 2147483729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483714, 2684354581, 2684354673, 2684354657, 2684354673, 2684354657, 2684354641, 2684354625, 2684354673, 2684354657, 2684354641, 2684354625, 2684354673, 2684354657, 2684354641, 2684354625, 1610612758,
            2147483745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97, 2147483745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97, 2147483745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3221225658, 3221225657, 3221225492, 3758096497, 3758096481, 3758096465, 3758096449, 3758096497, 3758096481, 3758096465, 3758096449, 3758096497, 3758096481, 3758096465, 3758096497, 3758096481, 3758096465, 3758096449, 3221225494,
            2147483761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 113, 2147483761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 113, 2147483761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3221225642, 3221225641, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 81,
            72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 71, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 71, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 65,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 81,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 97,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 1, 3, 2, 2, 1, 5, 0, 0, 0, 5, 3, 5, 3, 113,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 2147483713, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 3221225682, 229,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 2147483729, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 3221225682, 245,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97, 2147483745, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 3221225682, 197,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 113, 2147483761, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 3221225682, 197,
            2, 3, 3, 2, 5, 2, 2, 4, 1, 6, 3, 4, 4, 6, 3, 3, 2, 5, 1, 2, 6, 3, 1, 1, 3, 4, 3, 6, 4, 1, 2, 5, 2, 6, 5, 2, 5, 3, 6, 5, 2, 1, 4, 4, 5, 3, 4, 18, 22, 3, 4, 5, 4, 4, 1, 3, 2, 6, 1, 4, 4, 4, 4, 18,
            17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17
          }
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 64,
          height = 16,
          id = 1,
          name = "front layer",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          properties = {},
          encoding = "lua",
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 220, 221, 222, 0, 0, 0, 0, 191, 0, 0, 0,
            0, 7, 8, 9, 10, 0, 0, 0, 0, 0, 0, 7, 8, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 193, 194, 0, 0, 137, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 143, 144, 0, 0,
            0, 23, 24, 25, 26, 0, 0, 0, 0, 0, 0, 23, 24, 25, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 210, 0, 0, 153, 154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 159, 160, 0, 0,
            0, 39, 40, 41, 42, 0, 0, 0, 0, 0, 0, 39, 40, 41, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 55, 56, 57, 58, 0, 0, 0, 0, 0, 0, 55, 56, 57, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 77, 78, 78, 78, 0, 0, 0, 0, 0, 0, 78, 78, 78, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 141, 142, 0, 0, 0, 0, 0, 2147483778, 2147483777, 0,
            0, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 233, 234, 235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 157, 158, 0, 0, 0, 0, 0, 2147483794, 2147483793, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 210, 0, 0, 0, 0, 0, 0, 0, 0, 0, 193, 194, 0, 0, 175, 161, 162, 163, 164, 173, 174, 0, 0, 0, 0, 0, 143, 144, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483692, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 210, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 210, 0, 0, 191, 177, 178, 179, 180, 189, 190, 0, 0, 0, 0, 0, 159, 160, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483708, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 210, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 77, 77, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 210, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 135, 136, 0, 139, 140, 0, 0, 0, 0, 0, 0, 108, 93, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 24, 25, 26, 0, 0, 0, 0, 0, 0, 0, 0, 210, 29, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 151, 152, 0, 296, 297, 0, 0, 0, 0, 0, 108, 93, 0, 296, 297, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483692, 2147483691, 43, 44, 39, 40, 41, 42, 43, 44, 0, 0, 0, 0, 0, 0, 210, 47, 48, 2147483664, 2147483663, 0, 0, 0, 0, 0, 0, 0, 167, 168, 0, 312, 313, 0, 0, 0, 0, 108, 93, 0, 0, 312, 313, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483708, 2147483707, 59, 60, 55, 56, 57, 58, 59, 60, 0, 0, 0, 0, 0, 0, 210, 63, 64, 2147483680, 2147483679, 0, 0, 0, 0, 0, 0, 0, 183, 184, 0, 0, 0, 0, 0, 0, 108, 93, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 252, 253, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 253, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          type = "objectgroup",
          draworder = "topdown",
          id = 3,
          name = "objects",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          properties = {},
          objects = {
            {
              id = 18,
              name = "",
              type = "player",
              shape = "point",
              x = 14,
              y = 48,
              width = 0,
              height = 0,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 29,
              name = "",
              type = "trigger",
              shape = "rectangle",
              x = 254,
              y = 40,
              width = 2,
              height = 16.25,
              rotation = 0,
              visible = true,
              properties = {
                ["target"] = "second_level",
                ["type"] = "exit"
              }
            },
            {
              id = 33,
              name = "",
              type = "door",
              shape = "rectangle",
              x = 248,
              y = 40,
              width = 6,
              height = 16,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 34,
              name = "",
              type = "button",
              shape = "rectangle",
              x = 200,
              y = 48,
              width = 8,
              height = 8,
              rotation = 0,
              visible = true,
              properties = {
                ["autooff"] = false,
                ["group"] = "",
                ["link_"] = { id = 33 }
              }
            },
            {
              id = 42,
              name = "",
              type = "trigger",
              shape = "rectangle",
              x = 39,
              y = 28,
              width = 1,
              height = 28,
              rotation = 0,
              visible = true,
              properties = {
                ["target"] = "1",
                ["type"] = "dialog"
              }
            }
          }
        },
        {
          type = "objectgroup",
          draworder = "topdown",
          id = 4,
          name = "solid",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          properties = {},
          objects = {
            {
              id = 2,
              name = "",
              type = "",
              shape = "rectangle",
              x = 0,
              y = 56,
              width = 256,
              height = 8,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 4,
              name = "",
              type = "",
              shape = "rectangle",
              x = 76,
              y = 48,
              width = 16,
              height = 8,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 8,
              name = "",
              type = "",
              shape = "rectangle",
              x = 108,
              y = 48,
              width = 8,
              height = 8,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 13,
              name = "",
              type = "",
              shape = "rectangle",
              x = 188,
              y = 8,
              width = 8,
              height = 12,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 14,
              name = "",
              type = "",
              shape = "rectangle",
              x = 196,
              y = 12,
              width = 56,
              height = 8,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 16,
              name = "",
              type = "",
              shape = "rectangle",
              x = 252,
              y = 0,
              width = 4,
              height = 40,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 19,
              name = "",
              type = "",
              shape = "rectangle",
              x = 180,
              y = 12,
              width = 8,
              height = 3,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 20,
              name = "",
              type = "jumpable",
              shape = "rectangle",
              x = 224,
              y = 36,
              width = 12,
              height = 4,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 21,
              name = "",
              type = "",
              shape = "rectangle",
              x = 236,
              y = 36,
              width = 16,
              height = 4,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 30,
              name = "",
              type = "",
              shape = "rectangle",
              x = 124,
              y = 0,
              width = 8,
              height = 28,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 36,
              name = "",
              type = "",
              shape = "rectangle",
              x = 60,
              y = 0,
              width = 8,
              height = 28,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 37,
              name = "",
              type = "",
              shape = "rectangle",
              x = 0,
              y = 0,
              width = 4,
              height = 28,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 38,
              name = "",
              type = "",
              shape = "rectangle",
              x = 0,
              y = 28,
              width = 1,
              height = 28,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 39,
              name = "",
              type = "",
              shape = "polygon",
              x = 180,
              y = 36,
              width = 0,
              height = 0,
              rotation = 0,
              visible = true,
              polygon = {
                { x = 0, y = 0 },
                { x = 44, y = 0 },
                { x = 44, y = 4 },
                { x = 16, y = 4 },
                { x = 16, y = 20 },
                { x = 8, y = 20 },
                { x = 8, y = 4 },
                { x = 0, y = 4 }
              },
              properties = {}
            },
            {
              id = 40,
              name = "",
              type = "",
              shape = "polygon",
              x = 92,
              y = 56,
              width = 0,
              height = 0,
              rotation = 0,
              visible = true,
              polygon = {
                { x = 0, y = 0 },
                { x = 0, y = -24 },
                { x = 8, y = -24 },
                { x = 8, y = -16 },
                { x = 16, y = -16 },
                { x = 16, y = 0 }
              },
              properties = {}
            },
            {
              id = 41,
              name = "",
              type = "",
              shape = "polygon",
              x = 191,
              y = 8,
              width = 0,
              height = 0,
              rotation = 0,
              visible = true,
              polygon = {
                { x = 0, y = 0 },
                { x = 0, y = -8 },
                { x = -59, y = -8 },
                { x = -67, y = -8 },
                { x = -67, y = -12 },
                { x = 5, y = -12 },
                { x = 5, y = 0 }
              },
              properties = {}
            }
          }
        }
      }
    }
  }
}
