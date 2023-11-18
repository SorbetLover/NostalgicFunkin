var ballisticBg:FlxSprite;
var whittyCut:FlxSprite;

var wind, mBreak, mThrow, mSlam, TOE, soljaBOY, rumble:FlxSound;

function create() {
    game.stage.visible = false;
    wind = FlxG.sound.load(Paths.sound('Vs Whitty/windLmao'), 1, true);
    mBreak = FlxG.sound.load(Paths.sound('Vs Whitty/micBreak'));
    mThrow = FlxG.sound.load(Paths.sound('Vs Whitty/micThrow'));
    mSlam = FlxG.sound.load(Paths.sound('Vs Whitty/slammin'));
    TOE = FlxG.sound.load(Paths.sound('Vs Whitty/ouchMyToe'));
    soljaBOY = FlxG.sound.load(Paths.sound('Vs Whitty/souljaboyCrank'));
    rumble = FlxG.sound.load(Paths.sound('Vs Whitty/rumb'));

    colorBgAlpha = 0;
    whittyCut = new FlxSprite(game.dad.x, game.dad.y);
    whittyCut.frames = Paths.getSparrowAtlas('cuttinDeezeBalls');
    whittyCut.animation.addByPrefix('play', 'Whitty Ballistic Cutscene', 24);
    whittyCut.animation.play('play');
    whittyCut.antialiasing = true;
    add(whittyCut);

    game.stage.animation.play("bgBeforeBreak");

    wind.fadeIn();
    game.camHUD.visible = false;
    game.dad.visible = false;

    FlxG.camera.focusOn(game.camFollow.getPosition()); 
    focusOn(game.dad);

    new FlxTimer().start(10.5, function() {
        game.startCutscene(null, function() close());
        wind.fadeOut();
        remove(whittyCut);
        game.stage.animation.play('bgAfterBreak');
        game.camGame.fade(FlxColor.WHITE, 1, true); // epic fade after the cutscene
        game.camHUD.visible = true;
        game.dad.visible = true;
        game.stage.visible = true;
    });
    new FlxTimer().start(87/24, function() {
        mThrow.play();
    });
    new FlxTimer().start(86/24, function() {
        mSlam.play();
    });
    new FlxTimer().start(128/24, function() {
        game.stage.animation.play('bgDuringBreak');
        soljaBOY.play();
        game.camGame.shake(0.01, 0.2);
    });
    new FlxTimer().start(123/24, function() {
        rumble.play();
    });
    new FlxTimer().start(158/24, function() {
        TOE.play();
        game.camGame.shake(0.05, 3.5);
    });
    new FlxTimer().start(2+(158/24), function() {
        game.camGame.fade(FlxColor.WHITE, 1, false);
    });
    new FlxTimer().start(52/24, function() {
        mBreak.play();
        game.camGame.shake(0.0004, 0.2);
    });
}

public function focusOn(char) {
    var camPos = char.getCameraPosition();
    game.camFollow.setPosition(camPos.x, camPos.y);
    camPos.put();
}