function create() {
    var end:FlxSprite = new FlxSprite().loadGraphic(Paths.image("ending0001")).screenCenter();
    end.scrollFactor.set(0, 0);
    // CoolUtil.setSpriteSize(end, 1280, 720);
    add(end);
    FlxG.camera.zoom += 0.2;
    game.camHUD.visible = false; 
    FlxG.sound.playMusic(Paths.music("goodEnding"),1,false);
    FlxG.camera.fade(FlxColor.BLACK, 0.8, true);

    new FlxTimer().start(15, function() FlxG.switchState(new StoryMenuState()));
}

function update(elapsed:Float) if (controls.ACCEPT) FlxG.switchState(new StoryMenuState());