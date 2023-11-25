var upperBoppers:FlxSprite;
var bottomBoppers:FlxSprite;

function postCreate() {
	upperBoppers = new FlxSprite(-600, -200);
	upperBoppers.frames = Paths.getSparrowAtlas('stages/week1//upperBop');
	upperBoppers.animation.addByPrefix('bop', "Upper Crowd Bob", 24, false);
	upperBoppers.antialiasing = true;
	upperBoppers.scrollFactor.set(1.05, 1.05);
	upperBoppers.setGraphicSize(Std.int(upperBoppers.width * 1));
	upperBoppers.updateHitbox();
	add(upperBoppers);

	bottomBoppers = new FlxSprite(-600, -200);
	bottomBoppers.frames = Paths.getSparrowAtlas('stages/week1/bgFreaks');
	bottomBoppers.animation.addByPrefix('bop', 'Bottom Level Boppers', 24, false);
	bottomBoppers.antialiasing = true;
	bottomBoppers.scrollFactor.set(0.92, 0.92);
	bottomBoppers.setGraphicSize(Std.int(bottomBoppers.width * 1));
	bottomBoppers.updateHitbox();
	insert(members.indexOf(gf) - 1, bottomBoppers);
	if (Options.lowMemoryMode) {
		remove(upperBoppers);
		remove(bottomBoppers);
	} 
}

function beatHit(curBeat) {
    switch (curBeat % 2) {
        case 0:
            bottomBoppers.animation.play('bop', true);
        case 1:
            upperBoppers.animation.play('bop', true);
    }
}