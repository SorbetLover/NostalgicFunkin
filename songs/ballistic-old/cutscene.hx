var whittyCut:FlxSprite;
var wind, mBreak, mThrow, mSlam, TOE, soljaBOY, rumble:FlxSound;

function create() {
    dialogueBgAlpha = 0;

    /* load sound effects */
    wind = FlxG.sound.load(Paths.sound('Vs Whitty/windLmao'), 1, true); // Third parameter for looping the wind sound
    mBreak = FlxG.sound.load(Paths.sound('Vs Whitty/micBreak'));
    mThrow = FlxG.sound.load(Paths.sound('Vs Whitty/micThrow'));
    mSlam = FlxG.sound.load(Paths.sound('Vs Whitty/slammin'));
    TOE = FlxG.sound.load(Paths.sound('Vs Whitty/ouchMyToe'));
    soljaBOY = FlxG.sound.load(Paths.sound('Vs Whitty/souljaboyCrank'));
    rumble = FlxG.sound.load(Paths.sound('Vs Whitty/rumb'));

    whittyCut = new FlxSprite(-500, -100); // whitty cutscene character
    whittyCut.frames = Paths.getSparrowAtlas('cuttinDeezeBalls');
    whittyCut.animation.addByPrefix('play', 'Whitty Ballistic Cutscene', 24);
    whittyCut.animation.play('play');
    whittyCut.antialiasing = true;
    add(whittyCut);

    game.stage.getSprite('stage').animation.play('bgBeforeBreak'); // the stage when it's like idle or before it goes ballistic

    wind.fadeIn(); // fades in the wind sound
    game.camHUD.visible = false;
    game.dad.visible = false; // for the purpose of not showing a clone

    FlxG.camera.focusOn(game.camFollow.getPosition()); 
    focusOn(game.dad);

    // This goes from the first action/event that happens in the cutscene to the last in order
    new FlxTimer().start(52/24, function() {
        mBreak.play(); // Whitty breaking the mic sound
        game.camGame.shake(0.004, 0.2);
    });
    new FlxTimer().start(86/24, function() mSlam.play()); // slam mic sound
    new FlxTimer().start(87/24, function() mThrow.play()); // throw mic sound
    new FlxTimer().start(123/24, function() rumble.play()); // rumble sound

    new FlxTimer().start(128/24, function() {
        game.stage.getSprite('stage').animation.play('bgDuringBreak'); // This is when the stage begins to crack
        soljaBOY.play();
        game.camGame.shake(0.01, 0.2); // shakes the camera
    });
    new FlxTimer().start(158/24, function() {
        TOE.play();
        game.camGame.shake(0.05, 3.5);
    });
    new FlxTimer().start(2+(158/24), function() game.camGame.fade(FlxColor.WHITE, 1, false)); // fades the camera after he screams

    new FlxTimer().start(10.5, function() {
        game.startCutscene(null, function() close()); // starts the dialogue
        wind.fadeOut(); // fades out the wind sound
        remove(whittyCut); // removes the whitty cutscene char (might be removed automatically anyways)
        game.stage.getSprite('stage').animation.play('bgAfterBreak', true); // This is the main stage animation in which you play in
        game.camGame.fade(FlxColor.WHITE, 1, true); // smooth and epic fade in after the cutscene to not make it feel sudden
        game.camHUD.visible = true;
        game.dad.visible = true;
    });
}

public function focusOn(char) {
    var camPos = char.getCameraPosition();
    game.camFollow.setPosition(camPos.x, camPos.y);
    camPos.put();
}

function destroy() {
    game.stage.getSprite('stage').animation.remove('bgDuringBreak');
    game.stage.getSprite('stage').animation.remove('bgBeforeBreak');
}