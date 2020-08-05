config = {
    graphics = {
        scale = 8,
        resolution = { x=64, y=64 }
    },
    game = {
        roomSize = { x=64, y=64 }
    }
}
function love.conf(t)
    t.window.width = config.graphics.resolution.x * config.graphics.scale
    t.window.height = config.graphics.resolution.y * config.graphics.scale
    t.window.title = "colorless"
end