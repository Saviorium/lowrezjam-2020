local end_game = {}

function end_game:enter()
end

function end_game:draw()
    love.graphics.printf(
        'Thanks for playing',
        Fonts.thin.font,
        16,
        16,
        48 )
    love.graphics.setColor(1,1,1)
end


return end_game