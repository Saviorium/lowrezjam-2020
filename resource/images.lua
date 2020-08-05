Peachy = require "lib.peachy.peachy"
Class = require "lib.hump.class"

local Images = {}
local dir = "/resource/images"

Img = Class {
    init = function(self, img, path)
        self.img = img --хранит само изображение
        self.path = path --хранит путь внутри папки с изображениями, без расширения файла
    end
}

function recursimeImport( path, sprites )
    local lfs = love.filesystem
    local filesTable = lfs.getDirectoryItems(path)
    for _,file in ipairs(filesTable) do
        local path_to_file = path..'/'..file
        if love.filesystem.getInfo(path_to_file).type == 'file' then
            local extension = string.sub(file, string.find(file, "[.]")+1 )
            local name = string.sub(file,1, string.find(file, "[.]")-1)
            if extension == 'png' then
                Images[name] = Img(love.graphics.newImage(path_to_file), path.."/"..name)
                Images[name].img:setFilter("nearest", "nearest")
            end
        elseif love.filesystem.getInfo(path_to_file).type == 'directory' then
            if file == 'sprites' then
                sprites = true
            end
            recursimeImport(path_to_file, sprites)
        end
    end
end

recursimeImport(dir, false)

function Images.getNewPeachySprite(self, name)
    if Images[name] == null then
        error("I dont have image with name "..name, 2)
    else
        jsonFilePath = Images[name].path..".json"
        if love.filesystem.getInfo(jsonFilePath) --если нет файла json
        then
            return Peachy.new(jsonFilePath, Images[name].img)
        else
            error("I dont have json for image with name "..name, 2)
        end
    end
end
-- for index, obj in pairs(love.filesystem.getInfo( path_to_file)) do 
--     print(index, obj)
-- end
return Images