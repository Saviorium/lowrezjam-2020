require 'love.audio'

local tracks = {}
--moo https://freesound.org/people/Yudena/sounds/377603/
tracks.list_of_sounds = {
	jump = { filepath = "resource/music/sounds/jump.wav",
			   loopPoint = 0,
			   bpm = 160,
			   volume = 0.01
			 },
	dropdown = { filepath = "resource/music/sounds/dropdown.wav",
			   loopPoint = 0,
			   bpm = 160,
			   volume = 0.01
			 },
	buttonSelect = { filepath = "resource/music/sounds/button_select.wav",
			   loopPoint = 0,
			   bpm = 160,
			   volume = 0.01
			 },
	boxDrag = { filepath = "resource/music/sounds/box_drag.wav",
			   loopPoint = 0,
			   bpm = 160,
			   volume = 0.01
			 },
}

function tracks.set_next_track( index, loaded_tracks )
	loaded_tracks[index]:play()
	loaded_tracks[index]:on("end", tracks.set_next_track( index, loaded_tracks ))
	index = index + 1 
end

function tracks.play_sound( sound )
	source = love.audio.newSource( sound.filepath, 'static' )
	source:setVolume(sound.volume)
	source:play()
	return source
end


return tracks