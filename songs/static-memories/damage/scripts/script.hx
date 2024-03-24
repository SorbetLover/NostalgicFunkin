// script used as camera static thing
function stepHit(curStep){
    switch(curStep){
        case 540:
        	camHUD.angle = 200;
            camera.angle = 100;
			FlxTween.tween(camera, {angle: 0}, 1, {ease: FlxEase.cubeOut});
			FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.cubeOut});

    }
}