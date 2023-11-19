import funkin.game.cutscenes.DialogueCutscene;
var cameraExists = false;
public var dialogueBgAlpha:Float = 0.5;

function update(elapsed) {
    if (subState != null) cameraExists = true;
    else cameraExists = false;

    switch(cameraExists) {
        case true: /* if dialogue camera exists */
            if (subState.dialogueCamera != null /*|| !(buncha songs that use background images for the dialogue)*/ )  subState.dialogueCamera.bgColor = FlxColor.fromRGBFloat(255, 255, 255, dialogueBgAlpha);

        case false: /* if dialogue camera doesn't exist */

    }
}