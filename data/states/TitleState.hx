var logoBump:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/titlescreen/nf")).screenCenter();

function postCreate() {
    if (!FlxG.save.data.oldLogo) logoBump.loadGraphic(Paths.image("menus/titlescreen/nfOld"));
    logoBump.scale.set(1.25, 1.25);
    logoBump.antialiasing = true;
}

function postUpdate() {
    if (curBeat >= 16 || FlxG.keys.justPressed.ENTER) {
        add(logoBump);
    }
}

function beatHit(curBeat) {
    if (curBeat % 2 == 0) {
        FlxTween.tween(logoBump.scale, {x: 1.32, y: 1.32}, Conductor.crochet / 2000, {ease: FlxEase.cubeInOut,  type: FlxTween.BACKWARD});
    }
}