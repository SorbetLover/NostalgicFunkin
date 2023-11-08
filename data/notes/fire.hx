function onPlayerHit(e) {
    if (e.noteType == "fire") {
			e.showSplash = true;
			if (!e.note.isSustainNote) {
				e.healthGain -= 0.45; // Same damage as the og mod
				FlxG.sound.play(Paths.sound('burnSound'));
			} else e.healthGain = 0;
    }
}

function onPlayerMiss(e) {
	if (e.noteType == "fire") {
		e.cancel();
		deleteNote(e.note); // Deletes the note when it goes offscreen
	}
}

function onDadHit(e)
	if (!e.player && e.noteType == "fire")
		e.cancel();


function onNoteCreation(e) {
		switch (e.noteType) {
			case "fire":
				if (PlayState.opponentMode && e.strumLineID >= 1) e.note.wasGoodHit = true;
				if (!PlayState.opponentMode && e.strumLineID <= 0) e.note.wasGoodHit = true;
				e.noteSprite = "game/notes/fire";
				e.noteScale += 0.1;
				e.mustHit = false;
				e.note.splash = "fire"; // Set the splash
				e.note.updateHitbox();
				e.note.earlyPressWindow = 0.15; // so you wouldn't hit it too early whilst also making it so you wouldn't hit it pixel perfect
				e.note.latePressWindow = 0.2; // Same purpose as above
		}
}