return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.3.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 8,
  height = 8,
  tilewidth = 8,
  tileheight = 8,
  nextlayerid = 4,
  nextobjectid = 6,
  properties = {},
  tilesets = {
    {
      name = "placeholder_tileset",
      firstgid = 1,
      filename = "../graphics/placeholder_tileset.tsx",
      tilewidth = 8,
      tileheight = 8,
      spacing = 0,
      margin = 0,
      columns = 6,
      image = "../graphics/placeholder_tileset.png",
      imagewidth = 48,
      imageheight = 24,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 8,
        height = 8
      },
      properties = {},
      terrains = {},
      tilecount = 18,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "ground",
      x = 0,
      y = 0,
      width = 8,
      height = 8,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        13, 14, 15, 0, 0, 0, 0, 2147483657,
        9, 0, 0, 0, 0, 7, 0, 2147483657,
        9, 0, 0, 0, 0, 0, 0, 2147483657,
        9, 0, 0, 0, 0, 0, 0, 2147483657,
        9, 0, 0, 2147483660, 11, 11, 11, 2147483664,
        9, 0, 0, 0, 0, 0, 0, 0,
        9, 0, 0, 0, 0, 0, 0, 0,
        1, 2, 2, 3, 0, 2147483651, 2, 2
      }
    },
    {
      type = "objectgroup",
      id = 2,
      name = "solid",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "polygon",
          x = 24,
          y = 0,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 8 },
            { x = -16, y = 8 },
            { x = -16, y = 56 },
            { x = 8, y = 56 },
            { x = 8, y = 64 },
            { x = -24, y = 64 },
            { x = -24, y = 0 }
          },
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "polygon",
          x = 40,
          y = 8,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 8 },
            { x = 8, y = 8 },
            { x = 8, y = 0 }
          },
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "polygon",
          x = 56,
          y = 0,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 32 },
            { x = -32, y = 32 },
            { x = -32, y = 40 },
            { x = 8, y = 40 },
            { x = 8, y = 0 }
          },
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "polygon",
          x = 40,
          y = 56,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 8 },
            { x = 24, y = 8 },
            { x = 24, y = 0 }
          },
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      id = 3,
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 5,
          name = "",
          type = "player",
          shape = "point",
          x = 16,
          y = 48,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
