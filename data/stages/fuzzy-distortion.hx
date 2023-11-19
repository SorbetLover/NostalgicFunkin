var lights:FlxSprite;

function postCreate() {
    lights = new FlxSprite(-600, -200);
    lights.frames = Paths.getSparrowAtlas('stages/week1/lights');
    lights.animation.addByPrefix('light', "lightblink1", 1, false);
    lights.antialiasing = true;
    lights.scrollFactor.set(0.9, 0.9);
    lights.setGraphicSize(Std.int(lights.width * 1));
    lights.updateHitbox();
    insert(members.indexOf(gf) - 1, lights);
    stagebackkapiold.blend = "add";
    stagefrontkapiold.blend = "add";
}

function beatHit(curBeat)
    lights.animation.frameIndex += FlxG.random.int(1, 4); // offbeat because the original had it so fuck it