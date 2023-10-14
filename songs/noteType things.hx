// for noteType stuff
// NO TOUCHIES MAFAKA >:(
function onPlayerHit(note){
    if (note.noteType == "holynote"){
        boyfriend.playAnim("dodge", true);
        camHUD.shake(0.008, 0.04);
        FlxG.sound.play(Paths.sound("VS Mami/MAMI_shoot"));
        note.cancelAnim();
        trace("holley molley :O");
    }
}