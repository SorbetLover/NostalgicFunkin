function onPlayerHit(e) {
    if (e.noteType == null) e.showSplash = false;
}

function onNoteCreation(e) {
    switch (curSong) {
        case "event-horizon", "security", "stardust", "asteroids", "weightless", "ultraviolet":
            e.noteSprite = 'game/notes/spacey';

        case "singularity", "gravity":
            e.noteSprite = 'game/notes/darkSpacey';

        case "genocide":
            e.noteSprite = 'game/notes/TabiNote';

        case "wocky", "beathoven", "hairball", "nyaw", "fuzzy-distortion", "flatzone":
            e.noteSprite = 'game/notes/kapi';
    }
}

function onStrumCreation(e) {
    switch (curSong) {
        case "singularity", "gravity":
            e.sprite = 'game/notes/darkSpacey';

        case "genocide":
            e.sprite = 'game/notes/TabiNote';

        case "event-horizon", "security", "stardust", "asteroids", "weightless", "ultraviolet":
            e.sprite = 'game/notes/spacey';
            
        case "wocky", "beathoven", "hairball", "nyaw", "fuzzy-distortion", "flatzone":
            e.sprite = 'game/notes/kapi';
    }
}