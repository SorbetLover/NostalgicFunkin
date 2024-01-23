// Kade UI + some behavioral changes from Kade (not finished at all, but I'll get back to this from time to time/when it's pirority)

/*
    TODOS:
        - Kade sustain
        - Char immidately go to their idle animation after pressing/holding notes.
    :

    DONEs:
        - Char animation behavior after pressing/holding notes.
        - Disable note glow
        - icon bop? Not sure honestly
*/

public var kadeUI:Bool = FlxG.save.data.kadeUI;

function postCreate() {
    if (kadeUI) {
        for (i in strumLines.members)
            for (s in i.members)
                s.x -= 40;
    }
}

function postUpdate(elapsed) {
    if (!kadeUI) disableScript();

    if (kadeUI) {
        // I don't remember this exactly but it's old-old icon bop that I happened to make when porting another mod
        iconP1.scale.set(lerp(iconP1.scale.x, 1, 0.33), lerp(iconP1.scale.y, 1, 0.33));
        iconP2.scale.set(lerp(iconP2.scale.x, 1, 0.33), lerp(iconP2.scale.y, 1, 0.33));
    }
}

function onDadHit(e) {
    if (kadeUI) e.preventStrumGlow();
}

function onPostNoteCreation(e) {
    if (kadeUI) {
        if (e.note.isSustainNote && e.note.animation.name == "holdend")
            e.note.scale.y -= 0.4; // Closest I could get with kade sustains
    }
}

function onPostStrumCreation(e) {
    if (kadeUI) {
        // More of a personal thing but bascially bigger frames for pressing notes to mimick botplay's sudden note presses
        // Will be changed later probably
        if (FlxG.save.data.fastPress) e.strum.animation.addByIndices("confirm", e.animPrefix + " confirm", [0, 1, 2, 3], "", 60, false);
        e.strum.animation.addByIndices("pressed", e.animPrefix + " press", [0, 1, 2, 3], "", 12, false); // 12 frames when pressing (pretty minor detail :shrug:)

        // Characters will immidately go to their idle animation after pressing/holding notes.
        boyfriend.holdTime = FlxG.random.int(1, 2);
        dad.holdTime = FlxG.random.int(2, 4);
    }
}