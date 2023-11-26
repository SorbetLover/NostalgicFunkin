var whittyCut:FlxSprite;
var city, rip, fire, beepboop:FlxSound;

function create() {
    dialogueBgAlpha = 0;
    city = FlxG.sound.load(Paths.music('city'), 1, true);
    rip = FlxG.sound.load(Paths.sound('Vs Whitty/rip'));
    fire = FlxG.sound.load(Paths.sound('Vs Whitty/fire'));
    beepboop = FlxG.sound.load(Paths.sound('Vs Whitty/beepboop'));

    city.fadeIn();
    game.camGame.fade(FlxColor.BLACK, 0.5, true);
    game.dad.visible = false;
    game.camHUD.visible = false;
    game.gf.visible = false;
    game.boyfriend.x += 100;
    game.camGame.zoom = FlxG.camera.zoom + 0.05;
    game.camFollow.setPosition(190, 300);

    whittyCut = new FlxSprite(-500, -90);
    whittyCut.frames = Paths.getSparrowAtlas('whittyCutscene');
    whittyCut.animation.addByPrefix('play', 'Whitty Cutscene Startup', 24);
    whittyCut.animation.play('play');
    whittyCut.antialiasing = true;
    add(whittyCut);
    if (whittyCut.animation.finished) whittyCut.animation.finish();// checks if the animation is finished, then it freezes


    new FlxTimer().start(34/24, function() rip.play());
    new FlxTimer().start(41/24, function() fire.play());

    new FlxTimer().start(224/24, function() {
        remove(whittyCut);
        game.camHUD.visible = true;
        game.dad.visible = true;
        dialogueBgAlpha = 0.5;
        game.startCutscene(null, function() close());
        city.fadeOut();
    });
    new FlxTimer().start(147/24, function() {
        beepboop.play();
        game.boyfriend.playAnim("singLEFT", true);
    });
    new FlxTimer().start(170/24, function() {
        game.boyfriend.playAnim("idle", true);
        game.camFollow.setPosition(650, 400);
        game.camGame.zoom = FlxG.camera.zoom - 0.05;
    });
}