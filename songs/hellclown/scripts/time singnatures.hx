// Lunar: beatsPerMesure

var myText:FunkinText = new FunkinText(0, healthBarBG + 150, 500, "", 35).screenCenter();
function create() {
    myText.cameras = [camHUD];
    add(myText);
}

function postUpdate(){

    myText.text = curBeat % camZoomingInterval;
    if (curBeat % camZoomingInterval == 0) myText.text = "BEAT!";

    myText.color = curBeat % camZoomingInterval == 0 ? FlxColor.BLUE : FlxColor.WHITE;

    switch (curStep){
        case 476: camZoomingInterval = 7;
        case 700: camZoomingInterval = 4;

        // This is where it gets broken
        case 1212: camZoomingInterval = 7;
        case 1660: camZoomingInterval = 9; // The Intense part
        case 1948: camZoomingInterval = 5;
        case 2588: camZoomingInterval = 7;
    }
}