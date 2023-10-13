import funkin.game.cutscenes.DialogueCutscene;
var cameraExists = false;
var colorBgAlpha:Float = 0.8;

function update(elapsed) {
    if (subState.dialogueCamera != null) cameraExists = true;
    else cameraExists = false;

    switch(cameraExists) {
        case true: /* if dialogue camera exists */
            if (subState.dialogueCamera != null /*|| !(buncha songs that use background images for the dialogue)*/ )  subState.dialogueCamera.bgColor = FlxColor.fromRGBFloat(255, 255, 255, colorBgAlpha);

        case false: /* if dialogue camera doesn't exist */

    }
}