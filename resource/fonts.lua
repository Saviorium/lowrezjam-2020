local fonts = {
	medium = love.graphics.newFont("resource/fonts/blocks-3x3-monospaced.ttf", 7 ), -- http://dacosta.itch.io CC4.0
	small = love.graphics.newFont("resource/fonts/IttyBitty.ttf", 4 ), -- https://bathwater.itch.io/ittybitty-3x3-pixel-font free
}

fonts.medium:setFilter( "nearest", "nearest" )
fonts.small:setFilter( "nearest", "nearest" )

return fonts