function create() {
	if (!PlayState.isStoryMode) {
		the_void.animation.remove('bgboom');
	}
}

// Doesn't work for some reason
// function postCreate() {
// 	if (!FlxG.save.data.flashFX) the_void.animation.stop();
// }