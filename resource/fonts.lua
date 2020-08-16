local fonts = {
	--thin = { font = love.graphics.newFont("resource/fonts/m3x6.ttf", 16 ), height = 16, width = 5}, -- https://managore.itch.io/m3x6 free to use with attribution
	medium = { font = love.graphics.newFont("resource/fonts/blocks-3x3-monospaced.ttf", 7 ), height = 7, width = 3}, -- http://dacosta.itch.io CC4.0
	small = { font = love.graphics.newFont("resource/fonts/IttyBitty.ttf", 4 ),  height = 4, width = 2}, -- https://bathwater.itch.io/ittybitty-3x3-pixel-font free
	thin = { font = love.graphics.newImageFont( 'resource/fonts/lowres_font.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-=_+[]{};\':»,./<>?\\|*@#$%^&()!' ),  height = 7, width = 4}
}

fonts.thin.font:setFilter( "nearest", "nearest" )
fonts.medium.font:setFilter( "nearest", "nearest" )
fonts.small.font:setFilter( "nearest", "nearest" )

return fonts