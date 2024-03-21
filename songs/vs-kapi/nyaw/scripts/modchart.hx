var lights:FlxSprite;

function postCreate() {
    if (!Options.lowMemoryMode) {
        lights = new FlxSprite(-600, -200);
        lights.frames = Paths.getSparrowAtlas('stages/week1/lights');
        lights.animation.addByPrefix('light', "lightblink1", 1, false);
        lights.antialiasing = true;
        lights.scrollFactor.set(0.9, 0.9);
        lights.setGraphicSize(Std.int(lights.width * 1));
        lights.updateHitbox();
        insert(members.indexOf(gf) - 1, lights);
    }
}

function beatHit(curBeat) {
    if (camZooming && FlxG.camera.zoom < 1.35 && curBeat % 4 == 0){
			FlxG.camera.zoom += 0.015;
			camHUD.zoom += 0.03;
		}
		if (camZooming && FlxG.camera.zoom < 1.35 && curBeat % 1 == 0 && curBeat != 283 && curBeat != 282){
            // lights.visible = false;
			FlxG.camera.zoom += 0.02;
			camHUD.zoom += 0.022;
		}
        lights.animation.frameIndex += 1;

        switch (curBeat) {
            case 31, 135, 203: dad.playAnim('meow', true);
            case 282: FlxTween.tween(FlxG.camera, {zoom: 1}, 0.5, { ease: FlxEase.quadInOut});
            case 283: boyfriend.playAnim('hey', true);
            case 363: dad.playAnim('meow', true);
            case 434:
                dad.playAnim('stare', true);
                new FlxTimer().start(1.1, function(tmr:FlxTimer){
                    camGame.fade(FlxColor.BLACK, 0);
                });
        }
}