function postUpdate(elapsed:Float) {
    switch (curCameraTarget) {
		case 0:
        	// camFollow.setPosition(550 * 2, 750);
			FlxTween.tween(FlxG.camera, {zoom: 0.65}, (Conductor.stepCrochet * 4 / 2000), {ease: FlxEase.elasticInOut});
        	FlxG.camera.zoom = FlxMath.lerp(defaultCamZoom, FlxG.camera.zoom, 0.95);
		case 1:
        	// camFollow.setPosition(700 * 2, 750);
			FlxTween.tween(FlxG.camera, {zoom: 0.55}, (Conductor.stepCrochet * 4 / 2000), {ease: FlxEase.elasticInOut});
       		FlxG.camera.zoom = FlxMath.lerp(defaultCamZoom, FlxG.camera.zoom, 0.95);
	}
}