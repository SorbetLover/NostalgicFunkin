function onNoteHit(e) {
    if (e.note.isSustainNote) {
        if (e.character.curCharacter == "KAPI" || e.character.curCharacter == "kapi" || e.character.curCharacter == "Kapi" || e.character.curCharacter == "KAPI_ANGRY") {
            e.animSuffix = "-hold";
            // trace("this is kapi char");
        }
    } else {
        e.animSuffix = "";
    }
}