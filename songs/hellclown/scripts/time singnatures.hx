// Lunar: beatsPerMesure

var myText:FunkinText = new FunkinText(0, healthBarBG + 150, 500, "", 35).screenCenter();
function create() {
    myText.cameras = [camHUD];
    add(myText);
}

function postUpdate(){
    myText.text = curBeat % camZoomingInterval;
    switch (curStep){
        case 476: Conductor.changeBPM(197, 7);
        case 700: camZoomingInterval = 4;
        case 1212: camZoomingInterval = 7;
        case 1660: camZoomingInterval = 9; // The Intense part
        case 1948: camZoomingInterval = 5;
        case 2588: camZoomingInterval = 7;
    }
}