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
  nextlayerid = 26,
  nextobjectid = 86,
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
      type = "group",
      id = 22,
      name = "b",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      layers = {
        {
          type = "tilelayer",
          id = 23,
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
          id = 24,
          name = "solid",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          draworder = "topdown",
          properties = {},
          objects = {
            {
              id = 65,
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
              id = 66,
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
              id = 67,
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
              id = 68,
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
              id = 69,
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
              id = 70,
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
              id = 71,
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
              id = 72,
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
              id = 73,
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
              id = 74,
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
              id = 75,
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
              id = 76,
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
              id = 77,
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
          id = 25,
          name = "objects",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          draworder = "topdown",
          properties = {},
          objects = {
            {
              id = 78,
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
            },
            {
              id = 82,
              name = "",
              type = "box",
              shape = "rectangle",
              x = 96,
              y = 32,
              width = 8,
              height = 8,
              rotation = 0,
              visible = true,
              properties = {}
            }
          }
        }
      }
    },
    {
      type = "group",
      id = 18,
      name = "g",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      layers = {
        {
          type = "tilelayer",
          id = 19,
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
          id = 20,
          name = "solid",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          draworder = "topdown",
          properties = {},
          objects = {
            {
              id = 50,
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
              id = 51,
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
              id = 52,
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
              id = 53,
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
              id = 54,
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
              id = 55,
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
              id = 56,
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
              id = 57,
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
              id = 58,
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
              id = 59,
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
              id = 60,
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
              id = 61,
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
              id = 62,
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
          id = 21,
          name = "objects",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          draworder = "topdown",
          properties = {},
          objects = {
            {
              id = 63,
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
            },
            {
              id = 84,
              name = "",
              type = "box",
              shape = "rectangle",
              x = 80,
              y = 48,
              width = 8,
              height = 8,
              rotation = 0,
              visible = true,
              properties = {}
            }
          }
        }
      }
    },
    {
      type = "group",
      id = 17,
      name = "r",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      layers = {
        {
          type = "tilelayer",
          id = 9,
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
          id = 7,
          name = "solid",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          draworder = "topdown",
          properties = {},
          objects = {
            {
              id = 37,
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
              id = 38,
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
              id = 39,
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
              id = 40,
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
              id = 41,
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
              id = 42,
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
              id = 43,
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
              id = 44,
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
              id = 45,
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
              id = 46,
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
              id = 47,
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
              id = 48,
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
              id = 49,
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
            },
            {
              id = 19,
              name = "",
              type = "box",
              shape = "ellipse",
              x = 104,
              y = 40,
              width = 0,
              height = 0,
              rotation = 0,
              visible = true,
              properties = {}
            },
            {
              id = 85,
              name = "",
              type = "box",
              shape = "rectangle",
              x = 95,
              y = 45,
              width = 8,
              height = 8,
              rotation = 0,
              visible = true,
              properties = {}
            }
          }
        }
      }
    }
  }
}
