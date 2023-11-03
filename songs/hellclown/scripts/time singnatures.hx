// Lunar: beatsPerMesure
import funkin.backend.utils.NativeAPI;

var devMode:Bool = true;
var myText:FunkinText = new FunkinText(0, healthBarBG + 150, 500, "", 35).screenCenter();
function create() {
    myText.cameras = [camHUD];
    add(myText);
}

function postUpdate(){
    switch (curStep){
        case 476: camZoomingInterval = 7;
        case 700: camZoomingInterval = 4;

        case 1211: camZoomingInterval = 1;
        case 1212: camZoomingInterval = 8 - 1;
        // case 1240: camZoomingInterval = 7;

        case 1659: camZoomingInterval = 1;
        case 1660: camZoomingInterval = 9; // The Intense part
        case 1948: camZoomingInterval = 5;
        case 2588: camZoomingInterval = 7;
    }
}

function update(elapsed) {
    myText.text = curBeat % camZoomingInterval;
    if (devMode == true){
        if (startingSong || !canPause || paused || health <= 0) return;
        updateSpeed(FlxG.keys.pressed.TWO);
    
        if (FlxG.keys.pressed.THREE){
            player.cpu = true;
        }
    
        if (FlxG.keys.justPressed.F6)
            NativeAPI.allocConsole();
    }
}

function updateSpeed(fast:Bool) {
    if (!PlayState.opponentMode) {
        FlxG.timeScale = inst.pitch = vocals.pitch = (player.cpu = fast) ? 10 : 1;
        FlxG.sound.muted = fast;
        health = !(canDie != fast) ? 2 : health;
    }
}

function onGamePause() {updateSpeed(false);}
function onSongEnd() {updateSpeed(false);}
function destroy() {FlxG.timeScale = 1;FlxG.sound.muted = false;}