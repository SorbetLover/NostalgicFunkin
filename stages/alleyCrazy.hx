var thefunnyeffect:FlxSprite;

function create() {
	thefunnyeffect = new FlxSprite().loadGraphic(Paths.image("stages/Vs Whitty/alley/thefunnyeffect"));
	thefunnyeffect.screenCenter();
	thefunnyeffect.cameras = [camHUD];
	add(thefunnyeffect);
}

function postUpdate() {
	thefunnyeffect.alpha = health / maxHealth;
	// trace(thefunnyeffect.alpha);
}