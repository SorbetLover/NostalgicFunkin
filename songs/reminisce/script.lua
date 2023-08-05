local allowCountdown = false
function onStartCountdown()
	if isStoryMode and not allowCountdown and not seenCutscene then
		startDialogue('dialogue', 'NoFear');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end