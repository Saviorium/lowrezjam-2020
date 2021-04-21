require "love.audio"

local tracks = {}
tracks.list_of_sounds = {
    jump = {
        filepath = "resource/music/sounds/jump.wav",
        loopPoint = 0,
        bpm = 160,
        volume = 0.1
    },
    dropdown = {
        filepath = "resource/music/sounds/dropdown.wav",
        loopPoint = 0,
        bpm = 160,
        volume = 0.1
    },
    buttonSelect = {
        filepath = "resource/music/sounds/button_select.wav",
        loopPoint = 0,
        bpm = 160,
        volume = 0.1
    },
    boxDrag = {
        filepath = "resource/music/sounds/box_drag.wav",
        loopPoint = 0,
        bpm = 160,
        volume = 0.1
    },
    music = {
        filepath = "resource/music/colorless_ost.ogg",
        loopPoint = 0,
        bpm = 88,
        volume = 0.1
    }
}

function tracks.set_next_track(index, loaded_tracks)
    loaded_tracks[index]:play()
    loaded_tracks[index]:on("end", tracks.set_next_track(index, loaded_tracks))
    index = index + 1
end

function tracks.play_sound(sound, isForever)
    source = love.audio.newSource(sound.filepath, "static")
    source:setVolume(sound.volume)
    source:setLooping(isForever)
    source:play()
    return source
end

return tracks
