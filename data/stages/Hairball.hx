var upperBoppers:FlxSprite;
var littleGuys:FlxSprite;
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
    
        upperBoppers = new FlxSprite(-600, -200);
        upperBoppers.frames = Paths.getSparrowAtlas('stages/week1/upperBop');
        upperBoppers.animation.addByPrefix('bop', "Upper Crowd Bob", 24, false);
        upperBoppers.antialiasing = true;
        upperBoppers.scrollFactor.set(1.05, 1.05);
        upperBoppers.setGraphicSize(Std.int(upperBoppers.width * 1));
        upperBoppers.updateHitbox();
        add(upperBoppers);
         
        littleGuys = new FlxSprite(25, 200);
        littleGuys.frames = Paths.getSparrowAtlas('stages/week1/littleguys');
        littleGuys.animation.addByPrefix('bop', 'Bottom Level Boppers', 24, false);
        littleGuys.antialiasing = true;
        littleGuys.scrollFactor.set(0.9, 0.9);
        littleGuys.setGraphicSize(Std.int(littleGuys.width * 1));
        littleGuys.updateHitbox();
        insert(members.indexOf(lights) + 1, littleGuys);
    }
}

function beatHit(curBeat) {
    switch (curBeat % 2) {
        case 0: littleGuys.animation.play('bop', true);
        case 1: upperBoppers.animation.play('bop', true);
    }
    // lights.animation.frameIndex += FlxG.random.int(1, 4); if you want to go just like the original
    lights.animation.frameIndex += 1;
}