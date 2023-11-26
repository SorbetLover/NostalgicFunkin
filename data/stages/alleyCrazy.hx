var thefunnyeffect:FlxSprite;

function create() {
	thefunnyeffect = new FlxSprite().loadGraphic(Paths.image("stages/Vs Whitty/alley/thefunnyeffect"));
	thefunnyeffect.screenCenter();
	thefunnyeffect.cameras = [camHUD];
	add(thefunnyeffect);

	gf.playAnim("scared");

	if (!PlayState.isStoryMode) {
		stage.animation.remove('bgDuringBreak');
		stage.animation.remove('bgBeforeBreak');
	}
}

function postUpdate() {
	thefunnyeffect.alpha = health / maxHealth;
	// trace(thefunnyeffect.alpha);
}