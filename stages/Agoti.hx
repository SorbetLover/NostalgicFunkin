function create() {
	var whiteSquare = new FlxSprite();
	whiteSquare.makeGraphic(6000, 6000, FlxColor.WHITE);
	whiteSquare.x = "-490";
	whiteSquare.y = "-490";
	insert(members.indexOf(The_void), whiteSquare);

	FlxTween.tween(Void_Back, {y: -500}, 5, {ease: FlxEase.smootherStepInOut, type: FlxTween.PINGPONG});
	FlxTween.tween(gf, {y: -200}, 8, {ease: FlxEase.smootherStepInOut, type: FlxTween.PINGPONG});
}
