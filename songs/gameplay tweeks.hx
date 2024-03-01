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

var anims = ["singLEFT", "singDOWN", "singUP", "singRIGHT"];

function onNoteHit(e) {
    if (e.note.isSustainNote) e.healthGain = 0;
    // Same Snippet 
    // this is ne_eo script i think but i did add my "-hold" ting to it - 7oltan <3
    e.cancelAnim();
    for(char in e.characters) {
        if ((e.note.isSustainNote || e.note.nextNote?.isSustainNote)&&char.hasAnimation(anims[e.direction]+e.animSuffix+'-hold')&&e.note.animation.name != "holdend") 
            char.playSingAnim(e.direction, e.animSuffix+'-hold', "SING", true);
        else
            char.playSingAnim(e.direction, e.animSuffix, "SING", true);
        if((e.note.isSustainNote || e.note.nextNote?.isSustainNote) && e.note.animation.name != "holdend" && !char.hasAnimation(anims[e.direction]+e.animSuffix+'-hold')) {
            var frame = char.frame;
            char.animation.curAnim = null;
            char.frame = frame;
        }
    }
}