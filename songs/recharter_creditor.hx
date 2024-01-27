/* 
    recharter "creditor," as I couldn't figure how to play recharts
    in Story Mode with diffirent authors/recharters
    So, I made this instead.

    It's meant to show more appreaction to the recharter of the songs
    and (hopefully) more achknowledgement from players.
*/
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxText.FlxTextAlign;

var recharter:FunkinText = null;
var noteIco:Note;

function postCreate() {
    noteIco = new Note(playerStrums, {id: FlxG.random.int(0, 3)});
    noteIco.cameras = [camHUD];
    noteIco.setPosition(Std.int(healthBarBG.width / 2), healthBarBG.y - 80);
    noteIco.setGraphicSize(Std.int(noteIco.width * 0.32));
    insert(members.indexOf(iconP1) - 1, noteIco);

    recharter = new FunkinText(
        noteIco.x + noteIco.width - 35,
        noteIco.y + noteIco.height - 65,
        healthBarBG.width,
        recharter,
        null, false
    );

    recharter.setFormat(Paths.font("freeplay.ttf"), 19, FlxColor.WHITE, "LEFT");
    recharter.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1);
    recharter.cameras = [camHUD];
    insert(members.lastIndexOf(noteIco), recharter);

    noteIco.alpha = 0;
    recharter.alpha = 0;

    switch(PlayState.SONG.meta.name) {
        case "ballistic-old": if (this.difficulty == "Rechart") recharter.text = "Sol";
        
        case "hairball", "your-demise", "overhead", "lo-fight", "genocide", "foolhardy":
            if (this.difficulty == "Rechart") recharter.text = "MAZ";
        case "damage": if (this.difficulty == "fix") recharter.text = "Toni";
        
        default: recharter.text = "";
    }
}

function postUpdate() {
    if (recharter.text == "" || recharter.text == null) noteIco.kill();
}

function beatHit(curBeat) {
    if (curBeat % 1 == 0) {
        switch (noteIco.noteData) {
            case 0:
                for (a in [noteIco, recharter])
                    FlxTween.tween(a, {x: a.x - 5}, Conductor.crochet / 1000, {type: FlxTween.BACKWARD, ease: FlxEase.cubeInOut});
            case 1:
                for (a in [noteIco, recharter])
                    FlxTween.tween(a, {y: a.y + 5}, Conductor.crochet / 1000, {type: FlxTween.BACKWARD, ease: FlxEase.cubeInOut});
            case 2:
                for (a in [noteIco, recharter])
                    FlxTween.tween(a, {y: a.y - 5}, Conductor.crochet / 1000, {type: FlxTween.BACKWARD, ease: FlxEase.cubeInOut});
            case 3:
                for (a in [noteIco, recharter])
                    FlxTween.tween(a, {x: a.x + 5}, Conductor.crochet / 1000, {type: FlxTween.BACKWARD, ease: FlxEase.cubeInOut});
        }
    }
}

function onStartSong() {
    for (a in [noteIco, recharter]) FlxTween.tween(a, {alpha: 1}, Conductor.crochet / 4000);
}
