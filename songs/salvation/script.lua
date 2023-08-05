local allowCountdown = false;
local startDiag = false;
local allowCountdownEND = false;
local HolyPower = 25;
local Half = false;
local readySetGo = false;
function onCreate()
	setProperty('skipCountdown', true);
	precacheImage('ready');
	precacheImage('set');
	precacheImage('go');
	precacheSound('intro3');
	precacheSound('intro2');
	precacheSound('intro1');
	precacheSound('introGo');
	if difficulty >= 1 then
		precacheSound('ribbonpull_appear');
		precacheSound('ribbonpull_grab');
		precacheImage('healthribbon');
	end
	addCharacterToList('mami-holy-postsnap', 'dad');
	makeLuaSprite('black', '', 0, 0);
	addLuaSprite('black', false);
	setLuaSpriteCamera('black', 'other');
	makeGraphic('black', 1280, 720, '000000');

	makeLuaSprite('blackDialogue', '', 0, 0);
	addLuaSprite('blackDialogue', true);
	setLuaSpriteCamera('blackDialogue', 'camHUD');
	makeGraphic('blackDialogue', 1280, 720, '000000');
	if flashingLights == true then
		makeLuaSprite('flashHUD', '', 0, 0);
		addLuaSprite('flashHUD', false);
		setLuaSpriteCamera('flashHUD', 'camHUD');
		makeGraphic('flashHUD', 1280, 720, 'ffffff');
		setProperty('flashHUD.alpha', 0);
	end
	if downscroll == true then
		setProperty('botplayTxt.y', 520);
	else
		setProperty('botplayTxt.y', 180);
	end
	makeAnimatedLuaSprite('holynote', 'holynote', 0, 40);
	addAnimationByPrefix('holynote', 'holynote', 'blue', 24, false);
	addLuaSprite('holynote', true);
	setLuaSpriteCamera('holynote', 'camHUD');
	scaleObject('holynote', 0.8, 0.8);

	makeLuaText("HolyPowerText", '25%', 0, getProperty('holynote.x'), getProperty('holynote.y'));
	setTextFont('HolyPowerText', 'vcr.ttf')
	setObjectCamera('HolyPowerText', 'camHUD');
	setTextSize('HolyPowerText', 50);
	addLuaText('HolyPowerText');
	if downscroll == true then
		setProperty('holynote.y', 566);
	end
	if middlescroll == true then
		setProperty('holynote.x', 294);
		makeAnimatedLuaSprite('holynoteClone', 'holynote', 851, 40);
		addAnimationByPrefix('holynoteClone', 'holynote', 'blue', 24, false);
		addLuaSprite('holynoteClone', true);
		setLuaSpriteCamera('holynoteClone', 'camHUD');
		scaleObject('holynoteClone', 0.8, 0.8);

		makeLuaText("HolyPowerTextClone", '25%', 0, getProperty('holynoteClone.x'), getProperty('holynoteClone.y'));
		setTextFont('HolyPowerTextClone', 'vcr.ttf')
		setObjectCamera('HolyPowerTextClone', 'camHUD');
		setTextSize('HolyPowerTextClone', 50);
		addLuaText('HolyPowerTextClone');
		if downscroll == true then
			setProperty('holynoteClone.y', 566);
		end
	else
		screenCenter('holynote', 'x');
	end
end

function onStartCountdown()
	if isStoryMode and not allowCountdown and not startDiag and not seenCutscene then
		startVideo('Salvation_Finale');
		startDiag = true;
		return Function_Stop;
	end
	if startDiag and not allowCountdown then
		startDialogue('dialogue', '');
		setProperty('camHUD.visible', true);
		setProperty('holynote.visible', false);
		setProperty('HolyPowerText.visible', false);
		if middlescroll == true then
			setProperty('holynoteClone.visible', false);
			setProperty('HolyPowerTextClone.visible', false);
		end
		setProperty('black.visible', false);
		allowCountdown = true;
		return Function_Stop;
	end
	setProperty('camHUD.visible', false);
	setProperty('holynote.visible', true);
	setProperty('HolyPowerText.visible', true);
	if middlescroll == true then
		setProperty('holynoteClone.visible', true);
		setProperty('HolyPowerTextClone.visible', true);
	end
	setProperty('black.visible', true);
	setProperty('blackDialogue.visible', false);
	return Function_Continue;
end

function onBeatHit()
	light = math.random(1, 2);
	if curStep <= 2175 or curStep >= 2432 and curStep <= 2942 then
		if light == 1 and not inGameOver then
			setProperty('lampsLights.visible', true);
			doTweenColor('bfColor', 'boyfriend', 'b4abb7', 0.01, 'linear');
			doTweenColor('dadColor', 'dad', 'b4abb7', 0.01, 'linear');
			doTweenColor('gfColor', 'gf', 'b4abb7', 0.01, 'linear');
			doTweenColor('skyColor', 'sky', 'b4abb7', 0.01, 'linear');
			doTweenColor('trainColor', 'train', 'b4abb7', 0.01, 'linear');
			doTweenColor('floorColor', 'floor', 'b4abb7', 0.01, 'linear');
			doTweenColor('lampsColor', 'lamps', 'b4abb7', 0.01, 'linear');
			doTweenColor('objectsColor', 'objects', 'b4abb7', 0.01, 'linear');
			doTweenColor('womanColor', 'woman', 'b4abb7', 0.01, 'linear');
		elseif light == 2 and not inGameOver then
			setProperty('lampsLights.visible', false);
			doTweenColor('bfColor', 'boyfriend', '938a9b', 0.01, 'linear');
			doTweenColor('dadColor', 'dad', '938a9b', 0.01, 'linear');
			doTweenColor('gfColor', 'gf', '938a9b', 0.01, 'linear');
			doTweenColor('skyColor', 'sky', '938a9b', 0.01, 'linear');
			doTweenColor('trainColor', 'train', '938a9b', 0.01, 'linear');
			doTweenColor('floorColor', 'floor', '938a9b', 0.01, 'linear');
			doTweenColor('lampsColor', 'lamps', '938a9b', 0.01, 'linear');
			doTweenColor('objectsColor', 'objects', '938a9b', 0.01, 'linear');
			doTweenColor('womanColor', 'woman', '938a9b', 0.01, 'linear');
		end
	end
	if readySetGo == true then
		if curBeat % 4 == 1 then
			makeLuaSprite('ready', 'ready', 0, 0);
			addLuaSprite('ready', true);
			setLuaSpriteCamera('ready', 'other');
			screenCenter('ready', 'xy');
			doTweenAlpha('readyAlpha', 'ready', 0, 0.25);
			if curStep <= 64 then
				playSound('intro2');
			end
		elseif curBeat % 4 == 2 then
			makeLuaSprite('set', 'set', 0, 0);
			addLuaSprite('set', true);
			setLuaSpriteCamera('set', 'other');
			screenCenter('set', 'xy');
			doTweenAlpha('setAlpha', 'set', 0, 0.25);
			if curStep <= 64 then
				playSound('intro1');
			end
		elseif curBeat % 4 == 3 then
			makeLuaSprite('go', 'go', 0, 0);
			addLuaSprite('go', true);
			setLuaSpriteCamera('go', 'other');
			screenCenter('go', 'xy');
			doTweenAlpha('goAlpha', 'go', 0, 0.25);
			if curStep <= 64 then
				playSound('introGo');
			end
			readySetGo = false;
		end
	end
end

function onUpdate(elapsed)
	if allowCountdownEND == false then
		if curStep >= 1632 and curStep <= 1888 or curStep >= 2432 and curStep <= 2944 then
			cameraShake('camGame', 0.002, 0.2);
			cameraShake('camHUD', 0.002, 0.2);
			cameraShake('camOther', 0.002, 0.2);
		end
		if curStep >= 2944 then
			setProperty('mamiWin.visible', false);
			setProperty('iconP2.visible', true);
		end
		HolyPowertosting = tostring(HolyPower);
		if Half == true then
			setProperty('HolyPowerText.x', getProperty('holynote.x')-11);
			if middlescroll == true then
				setProperty('HolyPowerTextClone.x', getProperty('holynoteClone.x')-11);
			end
		else
			setProperty('HolyPowerText.x', getProperty('holynote.x')+19);
			if middlescroll == true then
				setProperty('HolyPowerTextClone.x', getProperty('holynoteClone.x')+19);
			end
		if middlescroll == true then
			setProperty('HolyPowerTextClone.y', getProperty('holynoteClone.y')+37);
		end
		setProperty('HolyPowerText.y', getProperty('holynote.y')+37);
		end
		if HolyPower >= 100 then
			setProperty('health', 0);
		end
	end
end

function onStepHit()
	if allowCountdownEND == false then
	if curStep == 48 or curStep == 1616 then
		playSound('intro3');
		readySetGo = true;
	end
	if curStep == 64 then
		setProperty('black.visible', false);
		setProperty('camHUD.visible', true);
	end
	if difficulty >= 1 then
		if curStep == 128 or curStep == 592 or curStep == 2048 then
			makeAnimatedLuaSprite('ribbon', 'healthribbon', 900, 525);
			addAnimationByPrefix('ribbon', 'show', 'ribbon_show', 24, false);
			addAnimationByPrefix('ribbon', 'move', 'ribbon_move', 24, false);
			addAnimationByPrefix('ribbon', 'dragging', 'ribbon_dragging', 24, true);
			addAnimationByPrefix('ribbon', 'ungrab', 'ribbon_ungrab', 24, false);
			addLuaSprite('ribbon', true);
			setLuaSpriteCamera('ribbon', 'camHUD');
			luaSpritePlayAnimation('ribbon', 'show');
			playSound('ribbonpull_appear', 1);
			runTimer('move', 1);
			runTimer('dragging', 1.35);
			if curStep == 128 then
				runTimer('ungrab', 10.5);
				runTimer('ribbonDelete', 10.75);
			else
				runTimer('ungrab', 7.5);
				runTimer('ribbonDelete', 7.75);
			end
			if downscroll == true then
				setProperty('ribbon.flipY', true);
				setProperty('ribbon.y', 5);
			end
		end
	end
	if curStep == 592 or curStep == 1632 or curStep == 2432 then
		setProperty('defaultCamZoom', 0.8);
	end
	if curStep == 704 or curStep == 872 or curStep == 1376 or curStep == 1888 or curStep == 3504 then
		setProperty('defaultCamZoom', 0.6);
	end
	if curStep == 840 then
		setProperty('defaultCamZoom', 0.9);
	end
	if curStep == 1243 then
		setProperty('black.visible', true);
		setProperty('black.alpha', 1);
		setProperty('camHUD.alpha', 0);
		setProperty('defaultCamZoom', 1);
	end
	if curStep == 1264 or curStep == 1296 or curStep == 1328 then
		setProperty('black.alpha', 0.25);
		doTweenAlpha('blackAlpha', 'black', 1, 0.6, 'linear');
	end
	if curStep == 1376 then
		setProperty('camHUD.alpha', 1);
		doTweenAlpha('blackAlpha', 'black', 0, 0.5, 'linear');
	end
	if curStep == 1632 then
		setProperty('flashHUD.alpha', 1);
		doTweenAlpha('flashHUDAlpha', 'flashHUD', 0, 4, 'linear');
		setProperty('gunsBack1.alpha', 1);
		setProperty('gunsFront1.alpha', 1);
	end
	if curStep == 1888 then
		doTweenAlpha('gunsBackAlpha', 'gunsBack1', 0, 0.5, 'linear');
		doTweenAlpha('gunsFrontAlpha', 'gunsFront1', 0, 0.5, 'linear');
	end
	if curStep == 2176 or curStep == 2944 then
		setProperty('flashHUD.alpha', 1);
		doTweenAlpha('flashHUDAlpha', 'flashHUD', 0, 4, 'linear');
		setProperty('lampsLights.alpha', 0);
		doTweenColor('bfBlack', 'boyfriend', '000000', 0.01, 'linear');
		doTweenColor('dadBlack', 'dad', '000000', 0.01, 'linear');
		doTweenColor('gfBlack', 'gf', '000000', 0.01, 'linear');
		doTweenColor('skyBlack', 'sky', '000000', 0.01, 'linear');
		setProperty('trainWhite.alpha', 1);
		doTweenColor('floorBlack', 'floor', '000000', 0.01, 'linear');
		doTweenColor('lampsBlack', 'lamps', '000000', 0.01, 'linear');
		doTweenColor('objectsBlack', 'objects', '000000', 0.01, 'linear');
		doTweenColor('womanBlack', 'woman', '000000', 0.01, 'linear');
	end
	if curStep == 2432 then
		setProperty('flashHUD.alpha', 1);
		doTweenAlpha('flashHUDAlpha', 'flashHUD', 0, 4, 'linear');
		setProperty('trainWhite.alpha', 0);
		setProperty('lampsLights.alpha', 1);
		setProperty('gunsBack1.alpha', 1);
		setProperty('gunsFront1.alpha', 1);
	end
	if curStep == 2944 then
		setProperty('gunsBack1.alpha', 0);
		setProperty('gunsFront1.alpha', 0);
	end
	if curStep == 3504 then
		setProperty('flashHUD.alpha', 1);
		doTweenAlpha('flashHUDAlpha', 'flashHUD', 0, 4, 'linear');
		setProperty('lampsLights.alpha', 1);
		setProperty('lampsLights.visible', true);
		doTweenColor('bfColor', 'boyfriend', 'b4abb7', 4, 'linear');
		doTweenColor('dadColor', 'dad', 'b4abb7', 4, 'linear');
		doTweenColor('gfColor', 'gf', 'b4abb7', 4, 'linear');
		doTweenColor('skyColor', 'sky', 'b4abb7', 4, 'linear');
		setProperty('trainWhite.alpha', 0);
		doTweenColor('floorColor', 'floor', 'b4abb7', 4, 'linear');
		doTweenColor('lampsColor', 'lamps', 'b4abb7', 4, 'linear');
		doTweenColor('objectsColor', 'objects', 'b4abb7', 4, 'linear');
		doTweenColor('womanColor', 'woman', 'b4abb7', 4, 'linear');
		doTweenAlpha('HUDAlpha', 'camHUD', 0, 6, 'linear');
	end
	if curStep == 3600 then
		doTweenAlpha('blackAlpha', 'black', 1, 4, 'linear');
	end
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'two' then
		setProperty('ready.alpha', 1);
		doTweenAlpha('readyAlpha', 'ready', 0, 0.25);
		if curStep <= 64 then
			playSound('intro2', 1);
		end
	end
	if tag == 'one' then
		setProperty('set.alpha', 1);
		doTweenAlpha('setAlpha', 'set', 0, 0.25);
		if curStep <= 64 then
			playSound('intro1', 1);
		end
	end
	if tag == 'go' then
		setProperty('go.alpha', 1);
		doTweenAlpha('goAlpha', 'go', 0, 0.25);
		if curStep <= 64 then
			playSound('introGo', 1);
		end
	end
	if tag == 'move' then
		luaSpritePlayAnimation('ribbon', 'move');
		doTweenAlpha('redArrowAlpha', 'redArrow', 1, 1, 'linear');
	end
	if tag == 'dragging' then
		luaSpritePlayAnimation('ribbon', 'dragging');
		playSound('ribbonpull_grab', 1);
		runTimer('draggingHP', 0.01, 0);
		doTweenAngle('HUDAngle', 'camHUD', 2, 1, 'sineInOut');
	end
	if tag == 'ungrab' then
		luaSpritePlayAnimation('ribbon', 'ungrab');
		doTweenAngle('HUDAngle', 'camHUD', 0, 0.3, 'linear');
		doTweenAlpha('redArrowAlpha', 'redArrow', 0, 1, 'linear');
		cancelTimer('draggingHP');
	end
	if tag == 'ribbonDelete' then
		removeLuaSprite('ribbon');
	end
	if tag == 'draggingHP' then
		setProperty('health', getProperty('health')-0.002);
	end
	if tag == 'HolyPowerDrain1' then
		HolyPower = HolyPower - 0.5;
		Half = true;
		setTextString('HolyPowerText', tostring(HolyPower) .. '%');
		runTimer('HolyPowerDrain2', 5);
		if middlescroll == true then
			setTextString('HolyPowerTextClone', tostring(HolyPower) .. '%');
		end
	end
	if tag == 'HolyPowerDrain2' then
		HolyPower = HolyPower - 0.5;
		Half = false;
		setTextString('HolyPowerText', tostring(HolyPower) .. '%');
		runTimer('HolyPowerDrain1', 5);
		if middlescroll == true then
			setTextString('HolyPowerTextClone', tostring(HolyPower) .. '%');
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'readyAlpha' then
		removeLuaSprite('ready');
	end
	if tag == 'setAlpha' then
		removeLuaSprite('set');
	end
	if tag == 'goAlpha' then
		removeLuaSprite('go');
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'holynote' then
		HolyPower = HolyPower + 25;
		setTextString('HolyPowerText', tostring(HolyPower) .. '%');
		if middlescroll == true then
			setTextString('HolyPowerTextClone', tostring(HolyPower) .. '%');
		end
		if difficulty <= 2 then
			runTimer('HolyPowerDrain1', 5);
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if difficulty >= 1 and getProperty('health') >= 0.05 and curStep >= 1632 and curStep <= 1888 or difficulty >= 1 and getProperty('health') >= 0.05 and curStep >= 2432 and curStep <= 2944 then
		if curStep <=1890 then
			setProperty('health', getProperty('health') -0.005);
		else
			setProperty('health', getProperty('health') -0.01);
		end
		setProperty('redArrow.alpha', 1);
		doTweenAlpha('redArrowAlpha', 'redArrow', 0, 1, 'linear');
	end
end

function noteMissPress(direction)
	if difficulty >= 1 and curStep >= 2752 and curStep <= 2800 then
		setProperty('health', getProperty('health') +0.0475);
	end
end

function onEndSong()
	if isStoryMode and not allowCountdownEND and not seenCutscene then
		removeLuaSprite('black');
		setProperty('camHUD.alpha', 1);
		setProperty('holynote.visible', false);
		setProperty('HolyPowerText.visible', false);
		if middlescroll == true then
			setProperty('holynoteClone.visible', false);
			setProperty('HolyPowerTextClone.visible', false);
		end
		setProperty('blackDialogue.visible', true);
		startDialogue('dialoguePOST', '');
		allowCountdownEND = true;
		return Function_Stop;
	end
	return Function_Continue;
end