function create() {
    FlxG.camera.focusOn(game.camFollow.getPosition());
    focusOn(game.dad);
    game.startCutscene("gar-", null, function(){
        FlxG.sound.play(Paths.sound('Wind_Fadeout'));
        FlxG.camera.fade(FlxColor.WHITE, 5, true, function(){
            game.startCutscene(null, function() close());
            game.camHUD.visible = true;
        }, true);
    });
} 

public function focusOn(char) {
    var camPos = char.getCameraPosition();
    game.camFollow.setPosition(camPos.x, camPos.y);
    camPos.put();
}