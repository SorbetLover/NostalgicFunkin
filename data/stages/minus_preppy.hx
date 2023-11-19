function beatHit(){
    switch(curBeat){
        case 96, 422:
            dad.playAnim("wink", true);

        case 98, 422:
            gf.playAnim("cheer", true);
    }

    if (curBeat == 96){
        FlxTween.tween(camera, {zoom: 1}, 1, {ease: FlxEase.sineIn});
    }
}