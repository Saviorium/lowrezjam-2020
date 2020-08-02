return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.3.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 24,
  height = 8,
  tilewidth = 8,
  tileheight = 8,
  nextlayerid = 4,
  nextobjectid = 19,
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
      width = 24,
      height = 8,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        13, 14, 15, 0, 0, 0, 0, 2147483657, 9, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        9, 0, 0, 0, 0, 7, 0, 2147483657, 9, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483651,
        9, 0, 0, 0, 0, 0, 0, 2147483657, 9, 0, 7, 0, 0, 0, 0, 0, 2147483651, 3, 0, 0, 0, 0, 2147483651, 2147483649,
        9, 0, 0, 0, 0, 0, 0, 2147483657, 9, 7, 0, 0, 0, 0, 0, 2147483660, 2147483664, 16, 12, 0, 0, 2147483651, 2147483649, 8,
        9, 0, 0, 2147483660, 11, 11, 11, 2147483664, 15, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483651, 2147483649, 8, 8,
        9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483651, 2147483649, 8, 8, 8,
        9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483651, 2147483649, 8, 8, 8, 8,
        1, 2, 2, 3, 0, 2147483651, 2, 2, 2, 2, 2, 2, 2, 3, 0, 0, 2147483651, 2, 2147483649, 8, 8, 8, 8, 8
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
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "polygon",
          x = 64,
          y = 64,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 48, y = 0 },
            { x = 48, y = -8 },
            { x = 0, y = -8 }
          },
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "polygon",
          x = 120,
          y = 32,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 32, y = 0 },
            { x = 32, y = -8 },
            { x = 24, y = -8 },
            { x = 24, y = -16 },
            { x = 8, y = -16 },
            { x = 8, y = -8 },
            { x = 0, y = -8 }
          },
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "polygon",
          x = 128,
          y = 64,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -8 },
            { x = 16, y = -8 },
            { x = 16, y = -16 },
            { x = 24, y = -16 },
            { x = 24, y = -24 },
            { x = 32, y = -24 },
            { x = 32, y = -32 },
            { x = 40, y = -32 },
            { x = 40, y = -40 },
            { x = 48, y = -40 },
            { x = 48, y = -48 },
            { x = 56, y = -48 },
            { x = 56, y = -56 },
            { x = 64, y = -56 },
            { x = 64, y = 0 }
          },
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "polygon",
          x = 64,
          y = 0,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 40 },
            { x = 8, y = 40 },
            { x = 8, y = 0 }
          },
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "polygon",
          x = 72,
          y = 24,
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
          id = 15,
          name = "",
          type = "",
          shape = "polygon",
          x = 80,
          y = 32,
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
          id = 16,
          name = "",
          type = "",
          shape = "polygon",
          x = 80,
          y = 24,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 8, y = 0 },
            { x = 8, y = -8 },
            { x = 0, y = -8 }
          },
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "polygon",
          x = 104,
          y = 16,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 8, y = 0 },
            { x = 8, y = -8 },
            { x = 0, y = -8 }
          },
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "polygon",
          x = 112,
          y = 8,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 8, y = 0 },
            { x = 8, y = -8 },
            { x = 0, y = -8 }
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
