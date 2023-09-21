// Shout out to ugh cutscene base game code

import flixel.util.FlxColor;
var blackScreen:FlxSprite = null;

function create() {
    blackScreen = new FlxSprite(0, 0).makeSolid(FlxG.width*3, FlxG.height*3, FlxColor.BLACK);
    blackScreen.screenCenter();
    add(blackScreen);

    game.camHUD.visible = false;

    FlxG.camera.focusOn(game.camFollow.getPosition());
    focusOn(game.dad);

    new FlxTimer().start(0.1, function(tmr:FlxTimer){
        remove(blackScreen);
        FlxG.sound.play(Paths.sound('brokenpad'));
        FlxG.camera.zoom = 1.1;
        new FlxTimer().start(0.2, function(tmr:FlxTimer){
            game.dad.playAnim('meow', true);
        });

        new FlxTimer().start(0.6, function(tmr:FlxTimer){
            game.camHUD.visible = true;
            blackScreen.destroy();
            FlxTween.tween(FlxG.camera, {zoom: game.defaultCamZoom}, 2.5, {
                ease: FlxEase.quadInOut,
                onComplete: function(twn:FlxTween){
                    game.startCutscene("mid-", function() {
                        close();
                    });
                }
            });
        });
    });
}

public function focusOn(char) {
    var camPos = char.getCameraPosition();
    game.camFollow.setPosition(camPos.x, camPos.y);
    camPos.put();
}