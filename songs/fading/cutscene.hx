var cityAmb:FlxSound;

function create() {
    cityAmb = FlxG.sound.load(Paths.music('city_ambience'));
    cityAmb.fadeIn();
    new FlxTimer().start(10, function(tmr:FlxTimer) cityAmb.fadeOut());
    game.startCutscene(null, function() close());
    FlxG.camera.focusOn(game.camFollow.getPosition());
    focusOn(game.dad);
}

public function focusOn(char) {
    var camPos = char.getCameraPosition();
    game.camFollow.setPosition(camPos.x, camPos.y);
    camPos.put();
}
