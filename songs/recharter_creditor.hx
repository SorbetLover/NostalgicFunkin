/* 
    recharter "creditor," as I couldn't figure how to play recharts
    in Story Mode with diffirent authors/recharters
    So, I made this instead.

    It's meant to show more appreaction to the recharter of the songs
    and (hopefully) more achknowledgement from players.
*/
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxText.FlxTextAlign;

var recharter:FunkinText = Json.parse(Assets.getText(Paths.chart(curSong, PlayState.difficulty))).recharter; // "recharter": "name"
var noteIco:Note;

function postCreate() {
    noteIco = new Note(playerStrums, {id: FlxG.random.int(0, 3)});
    noteIco.cameras = [camHUD];
    noteIco.antialiasing = Options.antialiasing;
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
    recharter.antialiasing = Options.antialiasing;
    recharter.cameras = [camHUD];
    insert(members.lastIndexOf(noteIco), recharter);

    noteIco.alpha = 0;
    recharter.alpha = 0;

    if (recharter.text == "" || recharter.text == null) {
        disableScript();
        noteIco.kill();
    }
}

function beatHit(curBeat) {
    if (curBeat % 1 == 0) {
        for (a in [noteIco, recharter]){
            var note:Int = noteIco.noteData;
            var xDir:Int = note == 0 ? -5 : (note == 3 ? 5 : 0);
            var yDir:Int = note == 2 ? -5 : (note == 1 ? 5 : 0);
            FlxTween.tween(a, {x:a.x + xDir,y:a.y + yDir}, Conductor.crochet / 1000, {type: FlxTween.BACKWARD, ease: FlxEase.cubeInOut});
        }
    }
}

function onStartSong() {
    for (a in [noteIco, recharter]) FlxTween.tween(a, {alpha: 1}, Conductor.crochet / 4000);
}
