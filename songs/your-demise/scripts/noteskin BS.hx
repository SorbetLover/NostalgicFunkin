function create() {
    /* If any coder is reading this, please tell me why
    can I change these vars in create
    And not in postCreate? as this SHOULD not take for me this long to fix the bug */
    importScript("data/scripts/pixel");
    pixelNotesForBF = false;
    pixelNotesForDad = false;

    camGame.fade(FlxColor.BLACK, 0);
}

function onNoteCreation(e) {
    e.noteSprite = "game/notes/NOTE_assets_pixelated";
    e.note.antialiasing = false;
}

function onStrumCreation(e) {
    e.sprite = "game/notes/NOTE_assets_pixelated";
    e.strum.antialiasing = false;
}


function stepHit(curStep){
	switch(curStep){
		case 128: camGame.fade(FlxColor.TRANSPARENT, 0.5, true);
        case 896: camGame.fade(FlxColor.BLACK, 3);
	}
}