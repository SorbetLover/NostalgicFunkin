import flixel.tweens.FlxTween;

function postCreate() {
	if(!PlayState.coopMode) {
	for (i in playerStrums.members) i.alpha = 1;
	for (i in cpuStrums.members) i.alpha = 1;
	}
}

function onCountdown(e) {
	if(e.swagCounter == 0 && !PlayState.coopMode) {
		if(PlayState.opponentMode) {
			for (i in cpuStrums.members) FlxTween.tween(i, {x: i.x + 320, angle: i.angle - 360}, 0.6, {ease: FlxEase.linear});
			for (i in playerStrums.members) FlxTween.tween(i, {x: i.x + 1000, angle: i.angle - 1000}, 0.6, {ease: FlxEase.linear}); // begone
		} else {
			for (i in playerStrums.members) FlxTween.tween(i, {x: i.x - 320, angle: 360}, 0.6, {ease: FlxEase.linear});
			for (i in cpuStrums.members) FlxTween.tween(i, {x: i.x - 1000, angle: 1000}, 0.6, {ease: FlxEase.linear}); // begone
		}
	}
}

function onNoteCreation(e) {
	if(!PlayState.coopMode && e.strumLineID == (PlayState.opponentMode ? 1 : 0)) e.note.visible = false;
}