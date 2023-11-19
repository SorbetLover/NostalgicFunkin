// NO TOUCHIES MAFAKA >:(
function onPlayerHit(note){
    // Will improve this later if it's needed
    if (note.noteType == "holynote"){
        boyfriend.playAnim("dodge", true);
        camHUD.shake(0.008, 0.04);
        FlxG.sound.play(Paths.sound("VS Mami/MAMI_shoot"));
        note.cancelAnim();
        trace("holley molley :O");
    }
}

function onNoteCreation(e) {
    switch (e.noteType) {
        case "holynote":
            if (PlayState.opponentMode && e.strumLineID >= 1) e.note.wasGoodHit = true;
            if (!PlayState.opponentMode && e.strumLineID <= 0) e.note.wasGoodHit = true;
            e.noteSprite = "game/notes/holynote";
            // e.note.earlyPressWindow = 0.1; // so you wouldn't hit it too early whilst also making it so you wouldn't hit it pixel perfect
            // e.note.latePressWindow = 0.2; // Same purpose as above
    }
}