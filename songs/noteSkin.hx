/*var notesSkins:String = '';

function postCreate(){
    switch(curSong){
        case "singularity" | "gravity":
            notesSkins = 'game/notes/darkSpacey';
        case "event-horizon" | "security" | "stardust" | "asteroids" | "weightless" | "ultraviolet":
            notesSkins = 'game/notes/spacey';
        default :
            notesSkins = 'game/notes/default';
    }
}*/

function onNoteCreation(event) {
	event.cancel();
	var note = event.note;

    switch(curSong){
        case "singularity" | "gravity":
	if (!event.cancel) {
		switch (event.noteType) {
			default:
				note.frames = Paths.getFrames('game/notes/darkSpacey');
			switch (event.strumID % 4 ) {
				case 0:
					note.animation.addByPrefix('scroll', 'purple alone0');
					note.animation.addByPrefix('hold', 'purple hold');
					note.animation.addByPrefix('holdend', 'purple tail0');
				case 1:
					note.animation.addByPrefix('scroll', 'blue alone0');
					note.animation.addByPrefix('hold', 'blue hold');
					note.animation.addByPrefix('holdend', 'blue tail');
				case 2:
					note.animation.addByPrefix('scroll', 'green alone0');
					note.animation.addByPrefix('hold', 'green hold');
					note.animation.addByPrefix('holdend', 'green tail');
				case 3:
					note.animation.addByPrefix('scroll', 'red alone0');
					note.animation.addByPrefix('hold', 'red hold');
					note.animation.addByPrefix('holdend', 'red tail');
			}
			note.scale.set(0.7, 0.7);
			note.updateHitbox();
            note.splash = "space";
		}
	}
    case "event-horizon" | "security" | "stardust" | "asteroids" | "weightless" | "ultraviolet":
        if (!event.cancel) {
            switch (event.noteType) {
                default:
                    note.frames = Paths.getFrames('game/notes/spacey');
                switch (event.strumID % 4 ) {
                    case 0:
                        note.animation.addByPrefix('scroll', 'purple alone0');
                        note.animation.addByPrefix('hold', 'purple hold');
                        note.animation.addByPrefix('holdend', 'purple tail0');
                    case 1:
                        note.animation.addByPrefix('scroll', 'blue alone0');
                        note.animation.addByPrefix('hold', 'blue hold');
                        note.animation.addByPrefix('holdend', 'blue tail0');
                    case 2:
                        note.animation.addByPrefix('scroll', 'green alone0');
                        note.animation.addByPrefix('hold', 'green hold');
                        note.animation.addByPrefix('holdend', 'green tail0');
                    case 3:
                        note.animation.addByPrefix('scroll', 'red alone0');
                        note.animation.addByPrefix('hold', 'red hold');
                        note.animation.addByPrefix('holdend', 'red tail0');
                }
                note.scale.set(0.7, 0.7);
                note.updateHitbox();
                note.splash = "space";
            }
        }
    default:
        if (!event.cancel) {
            switch (event.noteType) {
                default:
                    note.frames = Paths.getFrames('game/notes/default');
                switch (event.strumID % 4 ) {
                    case 0:
                        note.animation.addByPrefix('scroll', 'purple0');
                        note.animation.addByPrefix('hold', 'purple hold piece');
                        note.animation.addByPrefix('holdend', 'pruple end hold');
                    case 1:
                        note.animation.addByPrefix('scroll', 'blue0');
                        note.animation.addByPrefix('hold', 'blue hold piece');
                        note.animation.addByPrefix('holdend', 'blue hold end');
                    case 2:
                        note.animation.addByPrefix('scroll', 'green0');
                        note.animation.addByPrefix('hold', 'green hold piece');
                        note.animation.addByPrefix('holdend', 'green hold end');
                    case 3:
                        note.animation.addByPrefix('scroll', 'red0');
                        note.animation.addByPrefix('hold', 'red hold piece');
                        note.animation.addByPrefix('holdend', 'red hold end');
                }
                note.scale.set(0.7, 0.7);
                note.updateHitbox();

                case "holynote":
                    note.frames = Paths.getFrames('game/notes/noteType/holynote');
                switch (event.strumID % 4 ) {
                    case 0:
                        note.animation.addByPrefix('scroll', 'purple0');
                    case 1:
                        note.animation.addByPrefix('scroll', 'blue0');
                    case 2:
                        note.animation.addByPrefix('scroll', 'green0');
                    case 3:
                        note.animation.addByPrefix('scroll', 'red0');
                }
                note.scale.set(0.7, 0.7);
                note.updateHitbox();

                case "Invisible Hurt Note" | "Hurt Note":
                    note.frames = Paths.getFrames('game/notes/noteType/HURTNOTE');
                switch (event.strumID % 4 ) {
                    case 0:
                        note.animation.addByPrefix('scroll', 'purple0');
                        note.animation.addByPrefix('hold', 'hold piece');
                        note.animation.addByPrefix('holdend', 'hold end');
                    case 1:
                        note.animation.addByPrefix('scroll', 'blue0');
                        note.animation.addByPrefix('hold', 'hold piece');
                        note.animation.addByPrefix('holdend', 'hold end');
                    case 2:
                        note.animation.addByPrefix('scroll', 'green0');
                        note.animation.addByPrefix('hold', 'hold piece');
                        note.animation.addByPrefix('holdend', 'hold end');
                    case 3:
                        note.animation.addByPrefix('scroll', 'red0');
                        note.animation.addByPrefix('hold', 'hold piece');
                        note.animation.addByPrefix('holdend', 'hold end');
                }
                note.scale.set(0.7, 0.7);
                note.updateHitbox();
                note.avoid = true;
                note.canBeHit = false;
                note.wasGoodHit = false;
            }
        }
    }
}

function onStrumCreation(event) {
	event.cancel();
	var strum = event.strum;


    switch(curSong){
        case "singularity" | "gravity":
	if (!event.cancel) {
		strum.frames = Paths.getFrames('game/notes/darkSpacey');
		strum.animation.addByPrefix('green', 'arrowUP');
		strum.animation.addByPrefix('blue', 'arrowDOWN');
		strum.animation.addByPrefix('purple', 'arrowLEFT');
		strum.animation.addByPrefix('red', 'arrowRIGHT');
		strum.antialiasing = true;
		strum.scale.set(0.7,0.7);
		
		switch (event.strumID % 4) {
			case 0:
				strum.animation.addByPrefix("static", 'arrowLEFT0');
				strum.animation.addByPrefix("pressed", 'left press', 12, false);
				strum.animation.addByPrefix("confirm", 'left confirm', 24, false);
			case 1:
				strum.animation.addByPrefix("static", 'arrowDOWN0');
				strum.animation.addByPrefix("pressed", 'down press', 12, false);
				strum.animation.addByPrefix("confirm", 'down confirm', 24, false);
			case 2:
				strum.animation.addByPrefix("static", 'arrowUP0');
				strum.animation.addByPrefix("pressed", 'up press', 12, false);
				strum.animation.addByPrefix("confirm", 'up confirm', 24, false);
			case 3:
				strum.animation.addByPrefix("static", 'arrowRIGHT0');
				strum.animation.addByPrefix("pressed", 'right press', 12, false);
				strum.animation.addByPrefix("confirm", 'right confirm', 24, false);
		}	
		strum.updateHitbox();
	}
    case "event-horizon" | "security" | "stardust" | "asteroids" | "weightless" | "ultraviolet":
        if (!event.cancel) {
            strum.frames = Paths.getFrames('game/notes/spacey');
            strum.animation.addByPrefix('green', 'arrowUP');
            strum.animation.addByPrefix('blue', 'arrowDOWN');
            strum.animation.addByPrefix('purple', 'arrowLEFT');
            strum.animation.addByPrefix('red', 'arrowRIGHT');
            strum.antialiasing = true;
            strum.scale.set(0.7,0.7);
            
            switch (event.strumID % 4) {
                case 0:
                    strum.animation.addByPrefix("static", 'arrowLEFT0');
                    strum.animation.addByPrefix("pressed", 'left press', 12, false);
                    strum.animation.addByPrefix("confirm", 'left confirm', 24, false);
                case 1:
                    strum.animation.addByPrefix("static", 'arrowDOWN0');
                    strum.animation.addByPrefix("pressed", 'down press', 12, false);
                    strum.animation.addByPrefix("confirm", 'down confirm', 24, false);
                case 2:
                    strum.animation.addByPrefix("static", 'arrowUP0');
                    strum.animation.addByPrefix("pressed", 'up press', 12, false);
                    strum.animation.addByPrefix("confirm", 'up confirm', 24, false);
                case 3:
                    strum.animation.addByPrefix("static", 'arrowRIGHT0');
                    strum.animation.addByPrefix("pressed", 'right press', 12, false);
                    strum.animation.addByPrefix("confirm", 'right confirm', 24, false);
            }	
            strum.updateHitbox();
        }
    default:
        if (!event.cancel) {
            strum.frames = Paths.getFrames('game/notes/default');
            strum.animation.addByPrefix('green', 'arrowUP');
            strum.animation.addByPrefix('blue', 'arrowDOWN');
            strum.animation.addByPrefix('purple', 'arrowLEFT');
            strum.animation.addByPrefix('red', 'arrowRIGHT');
            strum.antialiasing = true;
            strum.scale.set(0.7,0.7);
            
            switch (event.strumID % 4) {
                case 0:
                    strum.animation.addByPrefix("static", 'arrowLEFT0');
                    strum.animation.addByPrefix("pressed", 'left press', 12, false);
                    strum.animation.addByPrefix("confirm", 'left confirm', 24, false);
                case 1:
                    strum.animation.addByPrefix("static", 'arrowDOWN0');
                    strum.animation.addByPrefix("pressed", 'down press', 12, false);
                    strum.animation.addByPrefix("confirm", 'down confirm', 24, false);
                case 2:
                    strum.animation.addByPrefix("static", 'arrowUP0');
                    strum.animation.addByPrefix("pressed", 'up press', 12, false);
                    strum.animation.addByPrefix("confirm", 'up confirm', 24, false);
                case 3:
                    strum.animation.addByPrefix("static", 'arrowRIGHT0');
                    strum.animation.addByPrefix("pressed", 'right press', 12, false);
                    strum.animation.addByPrefix("confirm", 'right confirm', 24, false);
            }	
            strum.updateHitbox();
        }
    }
}