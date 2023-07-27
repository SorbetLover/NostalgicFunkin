import flixel.util.FlxColor;
var blackScreen:FlxSprite = null;
var didCancel = false;

function onStartCountdown(event) {
	// Ne_Eo code
	if (playCutscenes && didCancel != (didCancel = true)) event.cancel();
	if (subState != null) subState.close();
}

function create() {
	playCutscenes = false; // 
}

function postCreate() {
    if (playCutscenes) {
        blackScreen = new FlxSprite(0, 0).makeSolid(FlxG.width*3, FlxG.height*3, FlxColor.BLACK);
        blackScreen.screenCenter();
        add(blackScreen);

        camHUD.visible = false;

        new FlxTimer().start(0.1, function(tmr:FlxTimer){
            remove(blackScreen);
            FlxG.sound.play(Paths.sound('brokenpad'));
            FlxG.camera.zoom = 1.1;
            new FlxTimer().start(0.2, function(tmr:FlxTimer){
                dad.playAnim('meow', true);
            });

            new FlxTimer().start(0.6, function(tmr:FlxTimer){
                camHUD.visible = true;
                remove(blackScreen, true);blackScreen.destroy();
                FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom}, 2.5, {
                    ease: FlxEase.quadInOut,
                    onComplete: function(twn:FlxTween){
                        startCountdown();
                        // startCutscene("mid-", cutscene);
						// if someone knows how to do this properly, let me know
						// It should start the countdown after the dialogue
                    }
                });
            });
        });
    } else {
        trace("freeplayin");
    }
}