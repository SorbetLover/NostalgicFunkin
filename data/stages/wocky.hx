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

function beatHit(curBeat)
    lights.animation.frameIndex += 1;