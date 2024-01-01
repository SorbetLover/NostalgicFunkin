function create() {

    game.startCutscene(null, function() close()); 
    FlxG.camera.focusOn(game.camFollow.getPosition()); 
    focusOn(game.dad);
    // openSubState(new ModSubState("MaginageDialogueState"));
}
function onEndSong(){
      game.startCutscene("end-dialogue", function() close());     
}
public function focusOn(char) {
    var camPos = char.getCameraPosition();
    game.camFollow.setPosition(camPos.x, camPos.y);
    camPos.put();
}
