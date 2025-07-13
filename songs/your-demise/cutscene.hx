function create() {
    game.startCutscene(null, function() close()); 
    FlxG.camera.focusOn(game.camFollow.getPosition()); 
}
function postCreate(){
    camFollow.setPosition(600,600);
}
public function focusOn(char) {
    var camPos = char.getCameraPosition();
    game.camFollow.setPosition(camPos.x, camPos.y);
    camPos.put();
}