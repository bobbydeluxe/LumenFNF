function onCreate()
    if startsWith(boyfriendName, "pico") then
        setPropertyFromClass("substates.StickerSubState", "STICKER_SET", "stickers-set-pico")
    end
end

function startsWith(str, start)
    return string.sub(str, 1, string.len(start)) == start
end