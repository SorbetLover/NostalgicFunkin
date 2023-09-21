import funkin.game.cutscenes.DialogueCutscene;
import flixel.util.FlxColor;

var cameraExists = false;

function postUpdate(elapsed) {
    if (subState != null) {
        cameraExists = true;
        // if (subState.dialogueCamera != null) subState.dialogueCamera.bgColor = FlxColor.fromRGBFloat(255, 255, 255, 0.5);
        camHUD.alpha = 0;
    } else {
        camHUD.alpha = 1;
    }
    // trace("Camera exists: " + cameraExists);
}