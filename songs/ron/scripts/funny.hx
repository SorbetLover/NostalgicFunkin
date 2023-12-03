function beatHit(b) {
    if (b == 2) {
        var bruh:FlxSprite = new FlxSprite();
		bruh.loadGraphic(Paths.image('meme/longbob'));
		bruh.antialiasing = true;
		bruh.active = false;
		bruh.scrollFactor.set();
		bruh.screenCenter();
		add(bruh);
		FlxTween.tween(bruh, {alpha: 0},1, {
			ease: FlxEase.cubeInOut,
			onComplete: function(twn:FlxTween)
			{
				bruh.destroy();
			}
		});
    }
    if (b == 7)
	{
		FlxTween.tween(FlxG.camera, {zoom: 1.5}, 0.4, {ease: FlxEase.expoOut,});
		dad.playAnim('cheer', true);
	}
	else if (b == 119)
	{
		FlxTween.tween(FlxG.camera, {zoom: 1.5}, 0.4, {ease: FlxEase.expoOut,});
		dad.playAnim('cheer', true);
	}
	else if (b == 215)
	{
		FlxTween.tween(FlxG.camera, {zoom: 1.5}, 0.4, {ease: FlxEase.expoOut,});
		dad.playAnim('cheer', true);
	}
}