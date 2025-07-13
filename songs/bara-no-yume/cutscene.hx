function create() {
    FlxG.camera.focusOn(game.camFollow.getPosition()); 

    FlxG.sound.play(Paths.sound("pixel/ANGRY_TEXT_BOX"));
    new FlxTimer().start(2, function(){
        game.startCutscene(null, function() close()); 
    });
}
function postCreate(){

    camFollow.setPosition(600,500);
}
public function focusOn(char) {
    var camPos = char.getCameraPosition();
    game.camFollow.setPosition(camPos.x, camPos.y);
    camPos.put();
}