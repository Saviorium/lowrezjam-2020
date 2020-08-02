config = {
    graphics = {
        scale = 8
    }
}
function love.conf(t)
    t.window.width = 64 * config.graphics.scale
    t.window.height = 64 * config.graphics.scale
    t.window.title = "colorless"
end