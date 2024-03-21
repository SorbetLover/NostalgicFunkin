function postCreate() {
    boyfriend.blend = "add";
    dad.blend = "add";
    gf.blend = "add";
}

function beatHit(curBeat) {
    if (camZooming && FlxG.camera.zoom < 1.35 && curBeat % 2 == 0) {
        FlxG.camera.zoom += 0.017;
        camHUD.zoom += 0.02;
    }
}