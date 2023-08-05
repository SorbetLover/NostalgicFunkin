local allowCountdown = false
local startDiag = false
function onCreate()
	if flashingLights == true then
		makeLuaSprite('flash', 'connect_flash', 0, 0);
		addLuaSprite('flash', true);
		setLuaSpriteCamera('flash', 'other');
		setProperty('flash.alpha', 0);
	end
end

function onStartCountdown()
	if isStoryMode and not allowCountdown and not startDiag and not seenCutscene then
		startVideo('Connect_Intro');
		startDiag = true;
		return Function_Stop;
	end
	if startDiag and not allowCountdown then
		startDialogue('dialogue', 'NoFear');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onStepHit()
	if curStep == 8 and flashingLights == true or curStep == 836 and flashingLights == true or curStep == 900 and flashingLights == true then
		setProperty('flash.alpha', 1);
		doTweenAlpha('flashAlpha', 'flash', 0, 1, 'linear');
		setProperty('defaultCamZoom', 0.9);
	end
	if curStep == 128 or curStep == 864 or curStep == 960 then
		setProperty('defaultCamZoom', 0.6);
	end
end