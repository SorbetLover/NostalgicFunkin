/*
    TODOS:
        - Option to move combo/ratings in-between strumlines (player and opponent)
        - Option to scale the strumlines
        - Screen Filter
        - Make an option for old sustain note behavior (same animation behavior as the old)
        - Make the hold animation and holdEnd animation a sperate animation to play/stop
*/

function create() {
    if (kadeUI) disableScript();
}

function onPostNoteCreation(e) {
    // Snippet by Ne_Eo Chars won't shake when holding the notes
    if (e.note.isSustainNote) e.note.prevNote?.nextNote = e.note;
    //
} 

// function noteMiss(e) {
//     if (e.note.isSustainNote) {
//         e.healthGain = 0;
//         e.accuracy = 0;
//         e.preventResetCombo();
//         e.muteVocals = false;
//         e.score = 0;
//         e.ghostMiss = false;
//     } 
// }

function onNoteHit(e) {
    if (e.note.isSustainNote) e.healthGain = 0;
    /* Same Snippet */
    e.cancelAnim();
    for(char in e.characters) {
        char.playSingAnim(e.direction, e.animSuffix, "SING", true);
        if((e.note.isSustainNote || e.note.nextNote?.isSustainNote) && e.note.animation.name != "holdend") {
            var frame = char.frame;
            char.animation.curAnim = null;
            char.frame = frame;
        }
    }
}