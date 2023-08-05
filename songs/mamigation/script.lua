function onCreate()
	setProperty('skipCountdown', true);
	setProperty('camHUD.visible', false);
	if dadName == 'mami-mamigation' then
		doTweenY('mamiY1', 'dad', 560, 4, 'sineInOut');
	end
end

function onStepHit()
	if curStep == 64 then
		setProperty('camHUD.visible', true);
	end
	if curStep == 2128 then
		setProperty('defaultCamZoom', 1.4);
	end
	if curStep == 2144 then
		setProperty('defaultCamZoom', 0.6);
	end
end

function onTweenCompleted(tag)
	if dadName == 'mami-mamigation' then
		if tag == 'mamiY1' then
			doTweenY('mamiY2', 'dad', 500, 4, 'sineInOut');
		end
		if tag == 'mamiY2' then
			doTweenY('mamiY1', 'dad', 560, 4, 'sineInOut');
		end
	end
end