 // sorry
function create() {

    game.startCutscene(null, function() close()); 
    FlxG.camera.focusOn(game.camFollow.getPosition()); 
    focusOn(game.dad);
    // openSubState(new ModSubState("MaginageDialogueState"));
}

public function focusOn(char) {
    var camPos = char.getCameraPosition();
    game.camFollow.setPosition(camPos.x, camPos.y);
    camPos.put();
}
