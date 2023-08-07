function create(){	
    new FlxTimer().start(0.01, function(tmr:FlxTimer)
    {
        if(brokeHolo.angle == 0) 
            FlxTween.angle(brokeHolo, 0, 180, 15);
        if(brokeHolo.angle == 180) 
            FlxTween.angle(brokeHolo, 180, 360, 15);
    }, 0);

    specialAnim = new FlxSprite(dad.x, dad.y - 40);
    specialAnim.frames = Paths.getSparrowAtlas('stages/Vs Void/space/specialAnim');
    specialAnim.animation.addByPrefix('scream', 'Scream', 20, true);
    specialAnim.animation.addByPrefix('succ', 'Succ', 20, true);
    specialAnim.animation.addByPrefix('stunned', 'Stunned', 12, true);
    specialAnim.animation.addByPrefix('defeat', 'Defeat', 12, false);
    specialAnim.updateHitbox();
    specialAnim.alpha = 0;
    specialAnim.antialiasing = true;
    specialAnim.updateHitbox();
    add(specialAnim);
    specialAnim.animation.play('scream', true, false, 0);
}
function update(elapsed:Float) {
}
function stepHit(curStep:Int) {
    switch (curStep){}
}
function beatHit(curBeat:Int) {
    switch (curBeat){
        case 72,328,456:
			camZoomingInterval = 1;
        case 264,392,696:
			camZoomingInterval = 4;
        
        case 136:

        FlxG.camera.flash(FlxColor.WHITE, 0.4);

        bgGlitch.alpha = 0.8;

        case 198:

        FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.38, 
            {ease: FlxEase.expoOut});
           
         case 231:

         FlxTween.num(defaultCamZoom, 0.90, 0.38, {ease: FlxEase.linear}, function(v:Float) {
            defaultCamZoom  = v;
          });
            specialAnim.animation.play('scream', true, false, 0);

            dad.alpha = 0;
            specialAnim.alpha = 1;

        case 232:

            dad.alpha = 1;
            specialAnim.alpha = 0;

        case 256:

        FlxTween.num(defaultCamZoom, 0.60, 0.38, {ease: FlxEase.linear}, function(v:Float) {
            defaultCamZoom  = v;
          });

        case 390:

            //dad.alpha = 0;
            //specialAnim.alpha = 1;
        
        case 392:

            //dad.alpha = 1;
            //specialAnim.alpha = 0;

            bgGlitch.alpha = 0;
        case 420:

        FlxTween.tween(FlxG.camera, {zoom: 1.0}, 1.0, 
            {ease: FlxEase.expoOut});
		case 468:

        FlxTween.tween(FlxG.camera, {zoom: 1.0}, 1.0, 
            {ease: FlxEase.expoOut});

        case 488:

        FlxTween.tween(FlxG.camera, {zoom: 1.0}, 0.85, 
            {ease: FlxEase.expoOut});

        case 520:

        bgGlitch.alpha = 0;

					
        case 584:

            FlxG.camera.flash(FlxColor.WHITE, 0.4);

            specialAnim.animation.play('succ', true, false, 0);	

            dad.alpha = 0;
            specialAnim.alpha = 1;

            bgGlitch.alpha = 0.8;

        case 680:

            FlxG.camera.flash(FlxColor.WHITE, 0.4);

            specialAnim.animation.play('stunned', true, false, 0);	

        case 690:

            dad.alpha = 1;
            specialAnim.alpha = 0;

        case 696:

            bgGlitch.alpha = 0;

        case 712:

            FlxTween.tween(cam, {alpha: 0.0}, 2.2, 
                {ease: FlxEase.quadIn});

        case 728:

            FlxG.camera.flash(FlxColor.WHITE, 3);

            dad.alpha = 0;
            specialAnim.alpha = 1;

            specialAnim.animation.play('defeat', true, false, 0);

            obv1.alpha = 0;
            obv2.alpha = 0;
            obv3.alpha = 0;
            bgGlitch.alpha = 0;
            brokeHolo.alpha = 0;
            neoBops.alpha = 0;
    }
}