local cutsceneStarted = false
function onEndSong()
    if isStoryMode == true and cutsceneStarted == false then
        if not isRunning('custom_events/Set Camera Target') then
            addLuaScript('custom_events/Set Camera Target')
        end
        if not isRunning('custom_events/Set Camera Zoom') then
            addLuaScript('custom_events/Set Camera Zoom')
        end

        makeLuaSprite('blackScreen')
        makeGraphic('blackScreen', 2000, 2500, '000000')
        screenCenter('blackScreen')
        setObjectCamera('blackScreen', 'camOther')
        addLuaSprite('blackScreen', true)
        setProperty('blackScreen.visible', false)

        createInstance('skipSprite', 'flixel.addons.display.FlxPieDial', {0, 0, 40, FlxColor('WHITE'), nil, 40, true, 24})
        callMethod('skipSprite.replaceColor', {FlxColor('BLACK'), FlxColor('TRANSPARENT')})
        setObjectCamera('skipSprite', 'camOther')
        addLuaSprite('skipSprite')
        setProperty('skipSprite.x', screenWidth - (getProperty('skipSprite.width') + 80))
        setProperty('skipSprite.y', screenHeight - (getProperty('skipSprite.height') + 72))
        setProperty('skipSprite.amount', 0)

        cutsceneStarted = true
        setProperty('camHUD.visible', false)
        playCutscene()
        return Function_Stop
    end
    return Function_Continue
end

function playCutscene()
    setProperty('inCutscene', true)
    setVar('cutsceneMode', true) -- Exclusive variable from custom camera events, more info there.
    startVideo('2hotCutscene')
    setProperty('videoCutscene.visible', false)
    setProperty('boyfriend.stunned', true)
    setProperty('dad.stunned', true)
    setProperty('gf.stunned', true)
    runTimer('beatHit', 60 / 168, 0)
    runTimer('setUpCutscene', 1)
    runTimer('picoPissed', 3)
    runTimer('darnellPissed', 3.5)
    runTimer('showVideo', 6)
end

local holdingTime = 0
function onUpdatePost(elapsed)
    if getProperty('inCutscene') == true then
        if keyPressed('accept') then
            holdingTime = math.max(0, math.min(1, holdingTime + elapsed))
        elseif holdingTime > 0 then
            holdingTime = math.max(0, math.lerp(holdingTime, -0.1, math.bound(elapsed * 3, 0, 1)))
        end
        setProperty('skipSprite.amount', math.min(1, math.max(0, (holdingTime / 1) * 1.025)))
        setProperty('skipSprite.alpha', math.remapToRange(getProperty('skipSprite.amount'), 0.025, 1, 0, 1))
    end
end

local curLoop = 0 -- Used to make Pico and Darnell smoothly go to their 'pissed' animation without cutting off another animation. 
function onTimerCompleted(tag, loops, loopsLeft)
    -- This is to make the characters bop their head to the beat of the cutscene's music.
    if tag == 'beatHit' then
        curLoop = curLoop + 1
        if curLoop <= 7 and getProperty('boyfriend.animation.finished') then
            characterDance('boyfriend')
        end
        if curLoop <= 10 and getProperty('dad.animation.finished') then
            characterDance('dad')
        end
        if getProperty('gf.animation.finished') then
            characterDance('gf')
        end
    end
    -- Moves the camera and zooms it out in preparation for the cutscene.
    if tag == 'setUpCutscene' then
        triggerEvent('Set Camera Target', 'None,1539,833.5', '2,quadInOut')
        triggerEvent('Set Camera Zoom', '0.69', '2,quadInOut')
    end
    -- Pico gets pissed off.
    if tag == 'picoPissed' then
        playAnim('boyfriend', 'intro1', true, false, 15)
    end
    -- Darnell gets pissed off.
    if tag == 'darnellPissed' then
        playAnim('dad', 'pissed', true)
    end
    -- Makes the video show up while the 'blackScreen' gets added behind.
    if tag == 'showVideo' then
        setProperty('videoCutscene.visible', true)
        setProperty('blackScreen.visible', true)
    end
end

function math.lerp(a, b, ratio)
    return a + ratio * (b - a) 
end

function math.bound(value, min, max)
    if value < min then
        value = min
    elseif value > max then
        value = max
    end
    return value
end

function math.remapToRange(value, start1, stop1, start2, stop2)
    return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end