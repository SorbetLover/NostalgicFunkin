var vine:FlxSprite;

function postCreate() {
	vine = new FlxSprite(155,620);

	vine.antialiasing = true;

	// load these once so it doesn't lag when we load em

	vine.frames = Paths.getSparrowAtlas("stages/Bushwhack/ZardyWeek2_Vines");

	vine.animation.addByPrefix("vine","Vine Whip instance",false);
	vine.setGraphicSize(Std.int(vine.width * 0.85));
	
	vine.alpha = 0;

	add(vine);
}

function postUpdate(elapsed:Float)
	defaultCamZoom = curCameraTarget ? 0.75 : 0.7;