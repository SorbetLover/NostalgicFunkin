block = false;
function onCreate()
	precacheSound('hpblockage_spawn');
	precacheSound('hpblockage_move');
	precacheSound('hpblockage_thud');
	precacheSound('hpblockage_clear');
	makeLuaSprite('block', 'health_blockage', 740, 0);
	addLuaSprite('block', true);
	setLuaSpriteCamera('block', 'other');
	scaleObject('block', 0.075, 0.075);
	setProperty('block.visible', false);

	makeAnimatedLuaSprite('crowd', 'crowd', 0, 720);
	addAnimationByPrefix('crowd', 'dance', 'crowd', 24, true);
	addLuaSprite('crowd', true);
	setLuaSpriteCamera('crowd', 'other');
	screenCenter('crowd', 'x');
	if flashingLights == true then
		makeLuaSprite('flash', 'tetris_flash', 0, 0);
		addLuaSprite('flash', true);
		setLuaSpriteCamera('flash', 'other');
		setProperty('flash.visible', false);
	end
end

function onBeatHit()
	if curStep >= 255 and curStep <= 638 and flashingLights == true or curStep >= 1144 and curStep <= 1406 and flashingLights == true then
		setProperty('flash.visible', true);
		setProperty('flash.alpha', 1);
		doTweenAlpha('flashAlpha', 'flash', 0.5, 0.3, 'linear');
		if curBeat % 20 == 0 then
			setProperty('flash.x', -2);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 1 then
			setProperty('flash.x', -1284);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 2 then
			setProperty('flash.x', -2566);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 3 then
			setProperty('flash.x', -2);
			setProperty('flash.y', -724);
		elseif curBeat % 20 == 4 then
			setProperty('flash.x', -1284);
			setProperty('flash.y', -724);
		elseif curBeat % 20 == 5 then
			setProperty('flash.x', -2);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 6 then
			setProperty('flash.x', -1284);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 7 then
			setProperty('flash.x', -2566);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 8 then
			setProperty('flash.x', -2);
			setProperty('flash.y', -724);
		elseif curBeat % 20 == 9 then
			setProperty('flash.x', -1284);
			setProperty('flash.y', -724);
		elseif curBeat % 20 == 10 then
			setProperty('flash.x', -2);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 11 then
			setProperty('flash.x', -1284);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 12 then
			setProperty('flash.x', -2566);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 13 then
			setProperty('flash.x', -2);
			setProperty('flash.y', -724);
		elseif curBeat % 20 == 14 then
			setProperty('flash.x', -1284);
			setProperty('flash.y', -724);
		elseif curBeat % 20 == 15 then
			setProperty('flash.x', -2);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 16 then
			setProperty('flash.x', -1284);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 17 then
			setProperty('flash.x', -2566);
			setProperty('flash.y', -2);
		elseif curBeat % 20 == 18 then
			setProperty('flash.x', -2);
			setProperty('flash.y', -724);
		elseif curBeat % 20 == 19 then
			setProperty('flash.x', -1284);
			setProperty('flash.y', -724);
		end
	else
		setProperty('flash.visible', false);
	end
	if curStep >= 1152 then
		triggerEvent('Add Camera Zoom');
	end
end

function onUpdate(elapsed)
	if block == true then
		if getProperty('health') >= 0.6 and curStep <= 216 then
			setProperty('health', 0.6);
		end
		if getProperty('health') >= 1.1 and curStep >= 672 and curStep <= 856 then
			setProperty('health', 1.1);
		end
		if getProperty('health') >= 0.9 and curStep >= 1120 and curStep <= 1360 then
			setProperty('health', 0.9);
		end
		if getProperty('health') >= 0.39 and curStep >= 1440 then
			setProperty('health', 0.39);
		end
	end
end

function onStepHit()
	if curStep == 4 then
		setProperty('defaultCamZoom', 0.9);
	end
	if curStep == 64 or curStep == 192 then
		setProperty('defaultCamZoom', 0.6);
	end
	if curStep == 112 or curStep == 676 or curStep == 1124 or curStep == 1450 then
		playSound('hpblockage_spawn', 1);
		runTimer('move1', 1);
		runTimer('move2', 1.15);
		runTimer('move3', 1.3);
		runTimer('move4', 1.45);
		runTimer('move5', 1.6);
		runTimer('move6', 1.75);
		runTimer('move7', 1.9);
		runTimer('move8', 2.05);
		runTimer('move9', 2.20);
		runTimer('move10', 2.35);
		runTimer('move11', 2.5);
		runTimer('move12', 2.65);
		if curStep == 676 then
			setProperty('block.x', 590);
		elseif curStep == 1124 then
			setProperty('block.x', 650);
		elseif curStep == 1450 then
			setProperty('block.x', 800);
		end
	end
	if curStep == 214 or curStep == 848 or curStep == 1352 or curStep == 1830 then
		setProperty('block.visible', false);
		playSound('hpblockage_clear', 1);
		block = false;
	end
	if curStep == 128 then
		setProperty('defaultCamZoom', 0.7);
	end
	if curStep == 1144 then
		doTweenY('crowdY', 'crowd', 320, 0.75, 'sineInOut');
	end
	if curStep == 1280 then
		doTweenY('crowdYOut', 'crowd', 720, 0.75, 'sineInOut');
	end
end

function onTweenCompleted(tag)
	if tag == 'crowdYOut' then
		removeLuaSprite('crowd');
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'move1' then
		setProperty('block.visible', true);
		if downscroll == true then
			setProperty('block.y', 660);
		else
			setProperty('block.y', -64);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move2' then
		if downscroll == true then
			setProperty('block.y', 600);
		else
			setProperty('block.y', -4);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move3' then
		if downscroll == true then
			setProperty('block.y', 540);
		else
			setProperty('block.y', 56);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move4' then
		if downscroll == true then
			setProperty('block.y', 480);
		else
			setProperty('block.y', 116);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move5' then
		if downscroll == true then
			setProperty('block.y', 420);
		else
			setProperty('block.y', 176);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move6' then
		if downscroll == true then
			setProperty('block.y', 360);
		else
			setProperty('block.y', 236);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move7' then
		if downscroll == true then
			setProperty('block.y', 300);
		else
			setProperty('block.y', 296);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move8' then
		if downscroll == true then
			setProperty('block.y', 240);
		else
			setProperty('block.y', 356);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move9' then
		if downscroll == true then
			setProperty('block.y', 180);
		else
			setProperty('block.y', 416);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move10' then
		if downscroll == true then
			setProperty('block.y', 120);
		else
			setProperty('block.y', 476);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move11' then
		if downscroll == true then
			setProperty('block.y', 60);
		else
			setProperty('block.y', 536);
		end
		playSound('hpblockage_move', 1);
	end
	if tag == 'move12' then
		if downscroll == true then
			setProperty('block.y', 0);
		else
			setProperty('block.y', 596);
		end
		playSound('hpblockage_thud', 1);
		cameraShake('camHUD', 0.002, 0.2);
		cameraShake('camOther', 0.002, 0.2);
		block = true;
	end
end