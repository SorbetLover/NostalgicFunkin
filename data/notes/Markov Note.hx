function onPlayerHit(e) {
    if (e.noteType == "Markov Note") {
			e.showSplash = false;
			if (!e.note.isSustainNote) {
				e.healthGain -= 5;
			}
    }
}

function onPlayerMiss(e) {
	if (e.noteType == "Markov Note") {
		e.cancel();
		deleteNote(e.note); // Deletes the note when it goes offscreen
	}
}

function onDadHit(e)
	if (!e.player && e.noteType == "Markov Note")
		e.cancel();


function onNoteCreation(e) {
		switch (e.noteType) {
			case "Markov Note":
				if (PlayState.opponentMode && e.strumLineID >= 1) e.note.wasGoodHit = true;
				if (!PlayState.opponentMode && e.strumLineID <= 0) e.note.wasGoodHit = true;
				e.noteSprite = "game/notes/Markov Note";
				e.noteScale += 4.3; // 5
				e.mustHit = false;
				// e.note.updateHitbox();
				e.note.antialiasing = false;
				e.note.earlyPressWindow = 0.15;
				e.note.latePressWindow = 0.2; 
		}
}