function create() {
    var end:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image("ending0001"));
    add(end);
    FlxG.sound.playMusic(Paths.music("goodEnding"),1,false);
    FlxG.camera.fade(FlxColor.BLACK, 0.8, true);

    new FlxTimer().start(30, function() FlxG.switchState(new StoryMenuState()));
}

function update(elapsed:Float) if (FlxG.keys.pressed.ACCEPT) FlxG.switchState(new StoryMenuState());