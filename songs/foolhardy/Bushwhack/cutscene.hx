function create() {
    game.camGame.zoom = 1;
    FlxG.camera.focusOn(game.camFollow.getPosition());
    focusOn(game.dad);
    var splash = new FlxSprite(-10,-10).loadGraphic(Paths.image("Splash"));
    splash.alpha = 1;
    splash.antialiasing = true;
    splash.setGraphicSize(Std.int(splash.width * 1.1));
    splash.scrollFactor.set();
    splash.cameras = [game.camHUD];
    add(splash);

    new FlxTimer().start(3, function(tmr:FlxTimer){
        FlxTween.tween(splash, {alpha: 0}, 0.4, {onComplete: function(tw){
            new FlxTimer().start(0.3, function(tmr:FlxTimer){
                    FlxTween.tween(game.camGame, {zoom: 0.71}, 1, {onComplete: function(a){
                        game.startCutscene("", function() {
                            close();
                        });
                    }});
                });
        }});
    });
}

public function focusOn(char) {
    var camPos = char.getCameraPosition();
    game.camFollow.setPosition(camPos.x, camPos.y);
    camPos.put();
}