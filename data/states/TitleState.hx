var logoBump:FlxSprite;

function postCreate() {
    logoBump = new FlxSprite().loadGraphic(Paths.image("menus/titlescreen/nf"));
    logoBump.scale.set(1.25, 1.25);
    logoBump.antialiasing = true;
    logoBump.screenCenter();
    add(logoBump);
}

function beatHit(curBeat) {
    FlxTween.tween(logoBump.scale, {x: 1.32, y: 1.32}, Conductor.crochet / 2000, {ease: FlxEase.cubeInOut,  type: FlxTween.BACKWARD});
}