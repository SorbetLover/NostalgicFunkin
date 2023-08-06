function create() {
    new FlxTimer().start(3.2, function(tmr:FlxTimer)
    {
        if(boppers.y == -330) FlxTween.tween(boppers, {y: -360}, 3.1, 
            {ease: FlxEase.quadInOut});
        else  FlxTween.tween(boppers, {y: -330}, 3.1, 
            {ease: FlxEase.quadInOut});
    }, 0);
    new FlxTimer().start(3, function(tmr:FlxTimer)
        {
            if(rocks.y == -65) FlxTween.tween(rocks, {y: -30}, 2.9, 
                {ease: FlxEase.quadInOut});
            else  FlxTween.tween(rocks, {y: -65}, 2.9, 
                {ease: FlxEase.quadInOut});
        }, 0);
    new FlxTimer().start(3, function(tmr:FlxTimer)
        {
            if(rock.y == -120) FlxTween.tween(rock, {y: -160}, 2.9, 
                {ease: FlxEase.quadInOut});
            else  FlxTween.tween(rock, {y: -120}, 2.9, 
                {ease: FlxEase.quadInOut});
        }, 0);
}
function update(elapsed:Float) {
}
function stepHit(curStep:Int) {
    switch (curStep){}
}
function beatHit(curBeat:Int) {
    if (curSong == "event-horizon"){
    switch (curBeat){
        case 136:

            FlxTween.tween(flash, {alpha: 1.0}, 0.2, 
                {ease: FlxEase.expoOut});

        case 137:

            FlxTween.tween(flash, {alpha: 0.0}, 0.8, 
                {ease: FlxEase.quadInOut});
        
        case 200:

            FlxTween.tween(flash, {alpha: 1.0}, 0.2, 
                {ease: FlxEase.expoOut});

        case 201:

            FlxTween.tween(flash, {alpha: 0.0}, 0.8, 
                {ease: FlxEase.quadInOut});

        case 264:

            FlxTween.tween(flash, {alpha: 1.0}, 0.2, 
                {ease: FlxEase.expoOut});

        case 265:

            FlxTween.tween(flash, {alpha: 0.0}, 0.8, 
                {ease: FlxEase.quadInOut});

        case 328:

            FlxTween.tween(flash, {alpha: 1.0}, 0.2, 
                {ease: FlxEase.expoOut});

        case 329:

            FlxTween.tween(flash, {alpha: 0.0}, 0.8, 
                {ease: FlxEase.quadInOut});

        case 368:

                FlxTween.tween(FlxG.camera, {zoom: 1.0}, 1.1, 
                    {ease: FlxEase.expoOut});

        case 372:

            FlxTween.tween(flash, {alpha: 1.0}, 0.2, 
                {ease: FlxEase.expoOut});

        case 373:

            FlxTween.tween(flash, {alpha: 0.0}, 0.8, 
                {ease: FlxEase.quadInOut});

        case 392:

            FlxTween.tween(flash, {alpha: 1.0}, 0.2, 
                {ease: FlxEase.expoOut});

        case 393:

            FlxTween.tween(flash, {alpha: 0.0}, 0.8, 
                {ease: FlxEase.quadInOut});
    }
}
}